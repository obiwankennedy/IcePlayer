#include "iceplayer.h"
#include <QtWidgets/QApplication>
#include <QFileInfo>
#include <QSettings>
#include <QDir>
#include <QQmlApplicationEngine>
#include "single_application.h"

static void associateFileTypes(const QStringList &fileTypes)
{
	QString displayName = QGuiApplication::applicationDisplayName();
	QString filePath = QCoreApplication::applicationFilePath();
	QString fileName = QFileInfo(filePath).fileName();

#if Q_OS_WINDOWS
    QSettings settings("HKEY_CURRENT_USER\\Software\\Classes\\Applications\\" + fileName, QSettings::NativeFormat);
	settings.setValue("FriendlyAppName", displayName);

	settings.beginGroup("SupportedTypes");
	foreach(const QString& fileType, fileTypes)
		settings.setValue(fileType, QString());
	settings.endGroup();

	settings.beginGroup("shell");
	settings.beginGroup("open");
	settings.setValue("FriendlyAppName", displayName);
	settings.beginGroup("Command");
	settings.setValue(".", QChar('"') + QDir::toNativeSeparators(filePath) + QString("\" \"%1\""));
#endif
}

int main(int argc, char *argv[])
{
	QApplication::addLibraryPath("./plugins");
	//QApplication app(argc, argv);

	SingleApplication app(argc, argv, "iceplayer");

	associateFileTypes(QStringList(".mp3"));
	const QStringList arguments = QCoreApplication::arguments();

	IcePlayer* player = NULL;

	player = new IcePlayer;

	if (arguments.size() > 1)
		player->ICE_Open_Music(arguments.at(1));

	player->show();


    // QML stuff
    QQmlApplicationEngine* engine = new QQmlApplicationEngine(&app);
    engine->load(QUrl("qrc:/resources/qml/main.qml"));
	
	return app.exec();
}
