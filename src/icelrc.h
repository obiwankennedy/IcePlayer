#ifndef ICE_LRC_H
#define ICE_LRC_H

#include <QtWidgets>
#include "lyric.h"

class ICE_Lrc : public QWidget{
	Q_OBJECT

public:
	ICE_Lrc(QWidget *parent = 0);
	~ICE_Lrc();

	void ICE_Start_Lrc_Mask(qint64 intervaltime);

	void ICE_Stop_Lrc_Mask();

	QString text() const;

	void setText(QString &t);
	
private:

	void paintEvent(QPaintEvent *event);

	ICE_Lrc_Label *lrcLabel;

};

#endif //ICE_LRC_H
