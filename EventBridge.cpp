#include "EventBridge.h"
#include <QString>
#include <QQmlContext>
#include <QtDebug>
#include <QThread>
#include <QtConcurrent>

EventBridge::EventBridge() {}

void EventBridge::register_bridge(QQmlApplicationEngine* engine){
    if (!engine){
        return;
    }
    get_instance()->_engine = engine;
    get_instance()->_engine->rootContext()->setContextProperty("EventBridge", EventBridge::get_instance());
}

QString EventBridge::invoke(const QString& event, const QVariant& data){
    QtConcurrent::run([=](){
        auto res =  data.toInt()*2;
        QThread::msleep(5000);
        emit asyncFinished(event,QString::number(res));
    });

    return "0";
}

QString EventBridge::invoke(const QString& event ){
    qDebug() << "invoke";
    qDebug() << "event:"<<event;
    return "0";
}

EventBridge* EventBridge::get_instance() {
    if (EventBridge::instance != nullptr) {
        return instance;
    }
    instance = new EventBridge();
}

EventBridge* EventBridge::instance = nullptr;
QQmlApplicationEngine* EventBridge::_engine = nullptr;
