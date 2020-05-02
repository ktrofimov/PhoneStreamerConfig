#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QScreen>
#include <QDesktopWidget>
#include <QSoundEffect>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    QSoundEffect ringtone, outgoingRing;
    QScreen *screen;
    int screenX, screenY, callId;
    //QString sipState, sipUser, sipServer, sipPass;

    void registerSip();
    void getSettings();
    void message(QString message);
    void error(QString error);
    void sipCommand(QString cmd, QString value);

private slots:
    void getScreen();
    void on_saveButton_clicked();
    void on_closeButton_clicked();
    void on_sipShowCount_stateChanged(int state);
    void valueSChanged( int value );
    void valueAChanged( int value );
};

#endif // MAINWINDOW_H
