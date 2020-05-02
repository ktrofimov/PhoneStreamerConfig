#include "mainwindow.h"
#include <QApplication>
#include <QFile>
#include <QTranslator>

void message( QString message );

int main(int argc, char *argv[])
{
    QFile styleF;
    QApplication a(argc, argv);

    styleF.setFileName(":/qdarkstyle/style.qss");
    if( styleF.open(QFile::ReadOnly) )
    {
        QString qssStr = styleF.readAll();
        a.setStyleSheet( qssStr );
    }

    QString locale = QLocale::system().name();
    locale.truncate( locale.lastIndexOf('_'));

    QTranslator psTranslator;
    if( psTranslator.load( "psc_"+locale, a.applicationDirPath()+"/translations") )
        a.installTranslator(&psTranslator);

    QTranslator qtTranslator;
    if( qtTranslator.load( "qt_"+locale, a.applicationDirPath()+"/translations") )
        a.installTranslator(&qtTranslator);

    MainWindow w;
    w.show();

    return a.exec();
}
