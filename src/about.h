#ifndef ABOUT_H
#define ABOUT_H

#include <QDialog>
//#include <QFrame>

class iceButton;

class about : public QDialog
{
	Q_OBJECT
public:
	about(QWidget *parent = 0);
	~about();

private slots:
	
private:
	iceButton *exitButton;

	void paintEvent(QPaintEvent *event); //�ô��ڻ����¼������Ʊ���ͼƬ


};


#endif