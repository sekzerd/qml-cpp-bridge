#ifndef EventBridge_H
#define EventBridge_H

#include <QObject>
#include <QQmlApplicationEngine>

class EventBridge : public QObject {
    Q_OBJECT
public:
    EventBridge();
    EventBridge(const EventBridge&) = delete;
    EventBridge& operator=(const EventBridge&) = delete;

public:
    Q_INVOKABLE QString invoke(const QString& event, const QVariant& data);
    Q_INVOKABLE QString invoke(const QString& event);

public:
    static EventBridge* instance;
    static EventBridge* get_instance();

public:
    static void register_bridge(QQmlApplicationEngine* engine);
    static QQmlApplicationEngine* _engine;

signals:
    void asyncFinished(QString event, QString result);
};


#endif  // EventBridge_H
