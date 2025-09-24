#ifndef QINPUTMETHODMANAGER_H
#define QINPUTMETHODMANAGER_H

#include <QtGui/qtguiglobal.h>
#include <QtCore/qobject.h>
#include <QtCore/qstring.h>
#include <QtCore/qhash.h>

QT_BEGIN_NAMESPACE

class QPlatformInputContext;
class QInputMethod;

class Q_GUI_EXPORT QInputMethodManager : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(QInputMethodManager)

public:
    static QInputMethodManager *instance();
    
    void loadInputMethods();
    void switchInputMethod(const QString &key);
    void addInputMethod(const QString &key, QPlatformInputContext *context);
    QStringList availableInputMethods() const;

    bool contains(const QString &key);
    
    QPlatformInputContext *currentInputContext() const;
    QString currentInputMethod() const;
    
    QInputMethodManager();
    ~QInputMethodManager();
    
private:
    void loadInputMethodFromEnv(const QByteArray &envValue, const QStringList &keys);
    
    QHash<QString, QPlatformInputContext*> m_inputMethods;
    QString m_currentKey;
    QPlatformInputContext *m_currentContext;
};

QT_END_NAMESPACE

#endif // QINPUTMETHODMANAGER_H