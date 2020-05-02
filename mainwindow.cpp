#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <pjsua2.hpp>

extern "C" {
#include <pjlib.h>
#include <pjlib-util.h>
#include <pjmedia.h>
#include <pjmedia-codec.h>
#include <pjsip.h>
#include <pjsip_simple.h>
#include <pjsip_ua.h>
#include <pjsua-lib/pjsua.h>
}

#include <QDebug>
#include <QSettings>
#include <QMessageBox>

using namespace pj;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    screen = QGuiApplication::screens().first();
    connect(screen, SIGNAL(virtualGeometryChanged(QRect)), this, SLOT(getScreen()));
    connect( ui->SVolume, SIGNAL(valueChanged(int)), this, SLOT( valueSChanged(int) ) );
    connect( ui->AVolume, SIGNAL(valueChanged(int)), this, SLOT( valueAChanged(int) ) );

    getScreen();

    Endpoint ep;
    EpConfig epCfg;

    ep.libCreate();
    ep.libInit(epCfg);
    ep.libStart();

    AudioDevInfoVector adv = ep.audDevManager().enumDev();
    qDebug() <<  QString(tr("Audio input devices found:" ));
    for( unsigned int s=0; s<adv.size(); s++ )
    {
        if( adv[s]->inputCount > 0 )
        {
            qDebug() << QString::fromLocal8Bit(adv[s]->name.data(), adv[s]->name.size());
            ui->sipInputDevice->addItem(QString::fromLocal8Bit(adv[s]->name.data(), adv[s]->name.size()).simplified());
        }
    }
    qDebug() <<  QString(tr("Audio output devices found:" ));
    for( unsigned int s=0; s<adv.size(); s++ )
    {
        if( adv[s]->outputCount > 0 )
        {
            qDebug() <<  QString::fromLocal8Bit(adv[s]->name.data(), adv[s]->name.size());
            ui->sipOutputDevice->addItem(QString::fromLocal8Bit(adv[s]->name.data(), adv[s]->name.size()).simplified());
        }
    }
    ep.libStopWorkerThreads();

    getSettings();
}

void MainWindow::valueSChanged( int value )
{
    ui->lblSVolumeVal->setText( QString("%1").arg((float)value/100) );
}

void MainWindow::valueAChanged( int value )
{
    ui->lblAVolumeVal->setText( QString("%1").arg((float)value/100) );
}

void MainWindow::getScreen()
{
    QRect rec = QApplication::desktop()->screenGeometry();
    screenY = rec.height();
    screenX = rec.width();
/*
    QFont font = ui->sipUserText->font();
    font.setPointSize(20);
    ui->sipUserText->setFont(font);
    ui->sipUser->setFont(font);
    ui->sipPassText->setFont(font);
    ui->sipPass->setFont(font);
    ui->sipServerText->setFont(font);
    ui->sipServer->setFont(font);
    ui->saveButton->setFont(font);
    ui->sipProtoText->setFont(font);
    ui->sipProtoBox->setFont(font);
    ui->sipPortText->setFont(font);
    ui->sipPort->setFont(font);
    ui->sipConfText->setFont(font);
    ui->sipConf->setFont(font);

    ui->psqlServerText->setFont(font);
    ui->psqlServer->setFont(font);
    ui->psqlBaseText->setFont(font);
    ui->psqlBase->setFont(font);
    ui->psqlUserText->setFont(font);
    ui->psqlUser->setFont(font);
    ui->psqlPassText->setFont(font);
    ui->psqlPass->setFont(font);
*/
}

void MainWindow::getSettings()
{
    QSettings settings(QApplication::applicationDirPath()+"/settings.ini", QSettings::IniFormat);
    settings.beginGroup("SIP");
    ui->sipServer->setText( settings.value("server", "").toString() );
    ui->sipUser->setText( settings.value("user", "").toString() );
    ui->sipPass->setText( settings.value("password", "").toString() );;
    ui->sipProtoBox->setCurrentText( settings.value("protocol", "UDP").toString() );
    ui->sipPort->setText( settings.value("port", "5060").toString() );
    ui->sipExtTrunk->setText( settings.value("trunk", "").toString() );
    ui->sipConf->setText( settings.value("conference", "").toString() );
    ui->sipConfPin->setText( settings.value("pin", "").toString() );
    ui->sipAutoConf->setChecked( settings.value("autoconf", false).toBool() );
    ui->sipShowCount->setChecked( settings.value("listeners", true).toBool() );
    ui->sipComments->setChecked( settings.value("comments", false).toBool() );
    ui->sipMultiComments->setChecked( settings.value("multicomm", false).toBool() );
    if( ui->sipShowCount->isChecked()==false )
    {
        ui->sipComments->setEnabled( false );
        ui->sipMultiComments->setEnabled( false );
    }
    int foundix = ui->sipInputDevice->findText( settings.value("inputdev", "").toString() );
    if( foundix != -1 )
        ui->sipInputDevice->setCurrentIndex(foundix);

    foundix = ui->sipOutputDevice->findText( settings.value("outputdev", "").toString() );
    if( foundix != -1 )
        ui->sipOutputDevice->setCurrentIndex(foundix);

    ui->allowVolume->setChecked( settings.value("allowvolume", false).toBool() );
    int soundvol = settings.value("svolume", 150).toInt();
    ui->SVolume->setValue( soundvol );
    ui->lblSVolumeVal->setText( QString("%1").arg((float)soundvol/100) );
    soundvol = settings.value("avolume", 150).toInt();
    ui->AVolume->setValue( soundvol );
    ui->lblAVolumeVal->setText(  QString("%1").arg((float)soundvol/100) );

    settings.endGroup();

    settings.beginGroup("PBX");
    ui->pbxType->setCurrentText( settings.value("type", "asterisk").toString() );
    ui->psqlServer->setText( settings.value("server", "").toString() );
    ui->psqlUser->setText( settings.value("user", "").toString() );
    ui->psqlPass->setText( settings.value("password", "").toString() );
    ui->psqlBase->setText( settings.value("database", "freesentral").toString() );
    ui->pbxChannel->setCurrentText( settings.value("channel", "SIP").toString() );
    settings.endGroup();

//    outgoingRing.setSource(QUrl::fromLocalFile(":/sounds/ring.wav"));
//    outgoingRing.setLoopCount(QSoundEffect::Infinite);
//    ringtone.setSource(QUrl::fromLocalFile(":/sounds/ring.wav"));
//    ringtone.setLoopCount(QSoundEffect::Infinite);
}

void MainWindow::on_saveButton_clicked()
{
    if(ui->sipUser->text()!=""
        && ui->sipPass->text()!=""
        && ui->sipServer->text()!=""
        && ui->sipPort->text()!=""
        && ui->sipConf->text()!=""
        && ui->psqlUser->text()!=""
        && ui->psqlPass->text()!=""
        && ui->psqlServer->text()!=""
        && ui->psqlBase->text()!="" )
    {
        QSettings settings( QApplication::applicationDirPath()+"/settings.ini", QSettings::IniFormat);
        // SIP
        settings.beginGroup("SIP");
        settings.setValue("server",     ui->sipServer->text().simplified() );
        settings.setValue("user",       ui->sipUser->text().simplified() );
        settings.setValue("password",   ui->sipPass->text().simplified() );
        settings.setValue("protocol",   ui->sipProtoBox->currentText().simplified() );
        settings.setValue("port",       ui->sipPort->text().simplified() );
        settings.setValue("trunk",      ui->sipExtTrunk->text().simplified() );
        settings.setValue("conference", ui->sipConf->text().simplified() );
        settings.setValue("pin",        ui->sipConfPin->text().simplified() );
        settings.setValue("autoconf",   ui->sipAutoConf->isChecked() );
        settings.setValue("listeners",  ui->sipShowCount->isChecked() );
        settings.setValue("comments",   ui->sipComments->isChecked() );
        settings.setValue("multicomm",  ui->sipMultiComments->isChecked() );
        settings.setValue("inputdev",   ui->sipInputDevice->currentText().simplified() );
        settings.setValue("outputdev",  ui->sipOutputDevice->currentText().simplified() );
        settings.setValue("allowvolume",ui->allowVolume->isChecked());
        settings.setValue("svolume",    ui->SVolume->value() );
        settings.setValue("avolume",    ui->AVolume->value() );
        settings.endGroup();
        // PostgreSQL
        settings.beginGroup("PBX");
        settings.setValue("type",       ui->pbxType->currentText().simplified() );
        settings.setValue("server",     ui->psqlServer->text().simplified() );
        settings.setValue("user",       ui->psqlUser->text().simplified() );
        settings.setValue("password",   ui->psqlPass->text().simplified() );
        settings.setValue("database",   ui->psqlBase->text().simplified() );
        settings.setValue("channel",    ui->pbxChannel->currentText().simplified() );
        settings.endGroup();
        message( tr("Settings are saved") );
    }
    else
        error( tr("Please fill in all fields") );
}

void MainWindow::message(QString message)
{
    QMessageBox msgBox;
    msgBox.setIcon(QMessageBox::Information);
    msgBox.setText(message);
    msgBox.setWindowTitle( tr("Config") );
    msgBox.exec();
}

void MainWindow::error(QString error)
{
    QMessageBox msgBox;
    msgBox.setIcon(QMessageBox::Critical);
    msgBox.setText(error);
    msgBox.setWindowTitle( tr("Error") );
    msgBox.exec();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_closeButton_clicked()
{
    close();
}

void MainWindow::on_sipShowCount_stateChanged(int state)
{
    if( state == Qt::Checked )
    {
        ui->sipComments->setEnabled( true );
        ui->sipMultiComments->setEnabled( true );
    }
    else
    {
        ui->sipComments->setEnabled( false );
        ui->sipMultiComments->setEnabled( false );
    }
}
