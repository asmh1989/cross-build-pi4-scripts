// Copyright (C) 2016 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

#ifndef QINPUTMETHOD_P_H
#define QINPUTMETHOD_P_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include <QtGui/private/qtguiglobal_p.h>
#include <qinputmethod.h>
#include <private/qobject_p.h>
#include <QtCore/QWeakPointer>
#include <QTransform>
#include <qpa/qplatforminputcontext.h>
#include <qpa/qplatformintegration.h>
#include <private/qguiapplication_p.h>
#include <qinputmethodmanager.h>

QT_BEGIN_NAMESPACE

class QInputMethodPrivate : public QObjectPrivate
{
    Q_DECLARE_PUBLIC(QInputMethod)

public:
    inline QInputMethodPrivate() : testContext(nullptr)
    {}
    QPlatformInputContext *platformInputContext() const
    {
        // 首先尝试使用输入法管理器
        QInputMethodManager *manager = QInputMethodManager::instance();
        if (manager) {
            auto key = QStringLiteral("qtvirtualkeyboard");
            if (manager->contains(key)) {
                QPlatformInputContext *context = manager->currentInputContext();
                if (context && context->isValid()) {
                    return context;
                }
            } else {
                qDebug() << "QInputMethodPrivate::platformInputContext: input method <qtvirtualkeyboard> not found, first add";
                auto context = QGuiApplicationPrivate::platformIntegration()->inputContext();
                if (context && context->isValid()) {
                    manager->addInputMethod(key, context);
                    return context;
                }
            }
        }
        
        // 如果输入法管理器不可用，回退到默认实现
        return testContext ? testContext : QGuiApplicationPrivate::platformIntegration()->inputContext();
    }
    static inline QInputMethodPrivate *get(QInputMethod *inputMethod)
    {
        return inputMethod->d_func();
    }

    void _q_connectFocusObject();
    void _q_checkFocusObject(QObject *object);
    static bool objectAcceptsInputMethod(QObject *object);

    QTransform inputItemTransform;
    QRectF inputRectangle;
    QPlatformInputContext *testContext;
};

QT_END_NAMESPACE

#endif
