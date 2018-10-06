#ifndef ABOUT_H
#define ABOUT_H

#include <QDialog>
//#include <QFrame>

class ICE_Ice_Button;

class about : public QDialog
{
	Q_OBJECT
public:
	about(QWidget *parent = 0);
	~about();

private slots:
	
private:
    ICE_Ice_Button *exitButton;
    void paintEvent(QPaintEvent *event);
};


#endif
