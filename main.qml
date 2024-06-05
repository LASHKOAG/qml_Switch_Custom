import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

ApplicationWindow {
    readonly property string appTitle: qsTr("[ Test Custom Switch]")

    id: appWindow
    objectName: "appWindow"
    width: 1024
    height: 768
    visible: true
    title: appTitle


    Rectangle{
        id: background
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#2f2f2f" }
            GradientStop { position: 1.0; color: "#000000" }
        }
    }


    //-------------- version 1 ----------------------------------------------------------------
//    Rectangle {
//        id: switchContainer
//        width: 200
//        height: 50
//        color: switchHandle.x > switchContainer.width / 2 ? "#55aa55" : "#aa5555"
//        radius: 25

//        Text {
//            text: switchHandle.x > switchContainer.width / 2 ? "Output" : "Inner"
//            anchors.centerIn: parent
//            color: "white"
//        }

//        MouseArea {
//            id: dragArea
//            anchors.fill: parent

//            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

//            onPressed: {
//                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
//            }

//            onReleased: {
//                let moveDistance = Math.abs(switchHandle.x - lastX);
//                let threshold = switchContainer.width * 0.15; // 15 процентов от ширины контейнера

//                if (moveDistance < threshold) {
//                    switchHandle.x = lastX; // Возвращаем в последнее положение
//                } else {
//                    // Перемещаем в противоположное крайнее положение
//                    switchHandle.x = (lastX === switchContainer.width - switchHandle.width)
//                            ? 0 // Если был в крайнем правом, перемещаем в крайнее левое
//                            : switchContainer.width - switchHandle.width; // Иначе, перемещаем в крайнее правое
//                }
//            }
//            drag.target: switchHandle
//            drag.axis: Drag.XAxis
//            drag.minimumX: 0
//            drag.maximumX: switchContainer.width - switchHandle.width
//        }

//        Rectangle {
//            id: switchHandle
//            width: switchContainer.height
//            height: switchContainer.height
//            radius: height / 2
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            x: 0 // начальное положение слева
//            //x:switchContainer.width - switchContainer.height // начальное положение справа

//            property real startX: 0 // Сохраняем начальное положение

//            Behavior on x {
//                NumberAnimation {
//                    duration: 300 // продолжительность анимации в миллисекундах
//                    easing.type: Easing.InOutQuad // тип плавности анимации
//                }
//            }
//        }
//    }
    //----------------------------------------------------------------------------------------------
    //-------------- version 2 ----------------------------------------------------------------
//    Rectangle {
//        id: switchContainer
//        width: 200
//        height: 50
//        color: switchHandle.x > switchContainer.width / 2 ? "#55aa55" : "#aa5555"
//        radius: 25

//        MouseArea {
//            id: dragArea
//            anchors.fill: parent

//            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

//            onPressed: {
//                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
//            }

//            onReleased: {
//                let moveDistance = Math.abs(switchHandle.x - lastX);
//                let threshold = switchContainer.width * 0.15; // 15 процентов от ширины контейнера

//                if (moveDistance < threshold) {
//                    switchHandle.x = lastX; // Возвращаем в последнее положение
//                } else {
//                    // Перемещаем в противоположное крайнее положение
//                    switchHandle.x = (lastX === switchContainer.width - switchHandle.width)
//                            ? 0 // Если был в крайнем правом, перемещаем в крайнее левое
//                            : switchContainer.width - switchHandle.width; // Иначе, перемещаем в крайнее правое

//                    //                            if((lastX === switchContainer.width - switchHandle.width)){
//                    //                                switchHandle.x = 0;
//                    //                            }else{
//                    //                                switchHandle.x = switchContainer.width - switchHandle.width;
//                    //                            }
//                }
//            }
//            drag.target: switchHandle
//            drag.axis: Drag.XAxis
//            drag.minimumX: 0
//            drag.maximumX: switchContainer.width - switchHandle.width
//        }

//        Rectangle {
//            id: switchHandle
//            width: switchContainer.height
//            height: switchContainer.height
//            radius: height / 2
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            x: 0 // начальное положение слева
//            //x:switchContainer.width - switchContainer.height // начальное положение справа

//            property real startX: 0 // Сохраняем начальное положение

//            Behavior on x {
//                NumberAnimation {
//                    duration: 300 // продолжительность анимации в миллисекундах
//                    easing.type: Easing.InOutQuad // тип плавности анимации
//                }
//            }

//            Text {
//                text: parent.x > switchContainer.width / 2 ? "ON" : "OFF"
//                anchors.centerIn: parent
//                color: "black"
//            }
//        }
//    }
    //----------------------------------------------------------------------------------------------
    //-------------- version 3 ----------------------------------------------------------------
//    Rectangle {
//        id: switchContainer
//        width: 100
//        height: 50
//        color: switchHandle.x > switchContainer.width / 5 ? "#55aa55" : "#aa5555"
//        radius: 25

//        MouseArea {
//            id: dragArea
//            anchors.fill: parent

//            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

//            onPressed: {
//                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
//            }

//            onReleased: {
//                let moveDistance = Math.abs(switchHandle.x - lastX);
//                let threshold = switchContainer.width * 0.15; // 15 процентов от ширины контейнера

//                if (moveDistance < threshold) {
//                    switchHandle.x = lastX; // Возвращаем в последнее положение
//                } else {
//                    // Перемещаем в противоположное крайнее положение
//                    switchHandle.x = (lastX === switchContainer.width - switchHandle.width)
//                            ? 0 // Если был в крайнем правом, перемещаем в крайнее левое
//                            : switchContainer.width - switchHandle.width; // Иначе, перемещаем в крайнее правое
//                }
//            }
//            drag.target: switchHandle
//            drag.axis: Drag.XAxis
//            drag.minimumX: 0
//            drag.maximumX: switchContainer.width - switchHandle.width
//        }

//        Rectangle {
//            id: switchHandle
//            width: 70 // Измененная ширина для продолговатой формы
//            height: switchContainer.height - 10 // Высота меньше, чтобы вписаться в контейнер
//            radius: 10 // Меньшее скругление углов
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            x: 0 // Начальное положение слева
//            //x:switchContainer.width - switchContainer.height // начальное положение справа

//            property real startX: 0 // Сохраняем начальное положение

//            Behavior on x {
//                NumberAnimation {
//                    duration: 300 // продолжительность анимации в миллисекундах
//                    easing.type: Easing.InOutQuad // тип плавности анимации
//                }
//            }

//            Text {
//                text: parent.x > switchContainer.width / 5 ? "Вкл" : "Выкл"
//                anchors.centerIn: parent
//                color: "black"
//            }
//        }
//    }
    //----------------------------------------------------------------------------------------------
    //-------------- version 4 ----------------------------------------------------------------

//    Rectangle {
//        id: switchContainer
//        width: 100
//        height: 40 //50
//        color: switchHandle.x > switchContainer.width / 5 ? "#55aa55" : "#aa5555"
//        radius: 25 //10

//        MouseArea {
//            id: dragArea
//            anchors.fill: parent

//            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

//            onPressed: {
//                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
//            }

//            onReleased: {
//                let moveDistance = Math.abs(switchHandle.x - lastX);
//                let threshold = switchContainer.width * 0.15; // 15 процентов от ширины контейнера

//                if (moveDistance < threshold) {
//                    switchHandle.x = lastX; // Возвращаем в последнее положение
//                } else {
//                    // Перемещаем в противоположное крайнее положение
//                    switchHandle.x = (lastX === switchContainer.width - switchHandle.width)
//                            ? 0 // Если был в крайнем правом, перемещаем в крайнее левое
//                            : switchContainer.width - switchHandle.width; // Иначе, перемещаем в крайнее правое
//                }
//            }
//            drag.target: switchHandle
//            drag.axis: Drag.XAxis
//            drag.minimumX: 0
//            drag.maximumX: switchContainer.width - switchHandle.width
//        }

//        Rectangle {
//            id: switchHandle
//            width: 70 // Измененная ширина для продолговатой формы
//            height: switchContainer.height - 2 // Высота меньше, чтобы вписаться в контейнер
//            radius: 10 // Меньшее скругление углов
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            x: 0 // Начальное положение слева
//            //x:switchContainer.width - switchContainer.height // начальное положение справа

//            property real startX: 0 // Сохраняем начальное положение

//            Behavior on x {
//                NumberAnimation {
//                    duration: 300 // продолжительность анимации в миллисекундах
//                    easing.type: Easing.InOutQuad // тип плавности анимации
//                }
//            }

//            Text {
//                text: parent.x > switchContainer.width / 5 ? "Вкл" : "Выкл"
//                anchors.centerIn: parent
//                color: "black"
//            }
//        }
//    }
    //----------------------------------------------------------------------------------------------
    //-------------- version 5 ----------------------------------------------------------------
//    Rectangle {
//        id: switchContainer
//        width: 100
//        height: 40 //40 //50
//        color: switchHandle.x > switchContainer.width / 5 ? "#55aa55" : "#aa5555"
//        radius: 10 //25 //10

//        MouseArea {
//            id: dragArea
//            anchors.fill: parent

//            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

//            onPressed: {
//                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
//            }

//            onReleased: {
//                let moveDistance = Math.abs(switchHandle.x - lastX);
//                let threshold = switchContainer.width * 0.15; // 15 процентов от ширины контейнера

//                if (moveDistance < threshold) {
//                    switchHandle.x = lastX; // Возвращаем в последнее положение
//                } else {
//                    // Перемещаем в противоположное крайнее положение
//                    switchHandle.x = (lastX === switchContainer.width - switchHandle.width)
//                            ? 0 // Если был в крайнем правом, перемещаем в крайнее левое
//                            : switchContainer.width - switchHandle.width; // Иначе, перемещаем в крайнее правое
//                }
//            }
//            drag.target: switchHandle
//            drag.axis: Drag.XAxis
//            drag.minimumX: 0
//            drag.maximumX: switchContainer.width - switchHandle.width
//        }

//        Rectangle {
//            id: switchHandle
//            width: 70 // Измененная ширина для продолговатой формы
//            height: switchContainer.height - 2 // Высота меньше, чтобы вписаться в контейнер
//            radius: 10 // Меньшее скругление углов
//            color: "white"
//            anchors.verticalCenter: parent.verticalCenter
//            x: 0 // Начальное положение слева
//            //x:switchContainer.width - switchContainer.height // начальное положение справа

//            property real startX: 0 // Сохраняем начальное положение

//            Behavior on x {
//                NumberAnimation {
//                    duration: 300 // продолжительность анимации в миллисекундах
//                    easing.type: Easing.InOutQuad // тип плавности анимации
//                }
//            }

//            Text {
//                text: parent.x > switchContainer.width / 5 ? "Вкл" : "Выкл"
//                anchors.centerIn: parent
//                color: "black"
//            }
//        }
//    }
    //----------------------------------------------------------------------------------------------
    //-------------- version 6 ----------------------------------------------------------------
    Rectangle {
        id: switchContainer
        width: 80
        height: 30 //50
        color: switchHandle.x > switchContainer.width / 10 ? "#55aa55" : "#aa5555"
        radius: 10 //25 //10

        MouseArea {
            id: dragArea
            anchors.fill: parent

            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

            onPressed: {
                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
            }

            onReleased: {
                let moveDistance = Math.abs(switchHandle.x - lastX);
                let threshold = switchContainer.width * 0.05; // 30 процентов от ширины контейнера

                if (moveDistance < threshold) {
                    switchHandle.x = lastX; // Возвращаем в последнее положение
                } else {
                    // Перемещаем в противоположное крайнее положение
                    switchHandle.x = (lastX === switchContainer.width - switchHandle.width)
                            ? 0 // Если был в крайнем правом, перемещаем в крайнее левое
                            : switchContainer.width - switchHandle.width; // Иначе, перемещаем в крайнее правое
                }
            }
            drag.target: switchHandle
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: switchContainer.width - switchHandle.width
        }

        Rectangle {
            id: switchHandle
                        width: 70 // Измененная ширина для продолговатой формы
                        //height: switchContainer.height - 10 // Высота меньше, чтобы вписаться в контейнер
                        height: switchContainer.height-2 // Высота меньше, чтобы вписаться в контейнер
                        radius: 10 // Меньшее скругление углов
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        x: 0 // Начальное положение слева
            //x:switchContainer.width - switchContainer.height // начальное положение справа

            property real startX: 0 // Сохраняем начальное положение

            Behavior on x {
                NumberAnimation {
                    duration: 300 // продолжительность анимации в миллисекундах
                    easing.type: Easing.InOutQuad // тип плавности анимации
                }
            }

            Text {
                text: parent.x > switchContainer.width / 10 ? "Вкл" : "Выкл"
                anchors.centerIn: parent
                color: "black"
            }
        }
    }
    //----------------------------------------------------------------------------------------------
    //-------------- version 7 ----------------------------------------------------------------

    //https://doc.qt.io/qt-6/qtquickcontrols-customize.html#customizing-switch
    /*
        Switch {
            id: control
            text: qsTr("Switch")

            indicator: Rectangle {
                implicitWidth: 48
                implicitHeight: 26
                x: control.leftPadding
                y: parent.height / 2 - height / 2
                radius: 13
                color: control.checked ? "#17a81a" : "#ffffff"
                border.color: control.checked ? "#17a81a" : "#cccccc"

                Rectangle {
                    x: control.checked ? parent.width - width : 0
                    width: 26
                    height: 26
                    radius: 13
                    color: control.down ? "#cccccc" : "#ffffff"
                    border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
                }
            }

            contentItem: Text {
                text: control.text
                font: control.font
                opacity: enabled ? 1.0 : 0.3
                color: control.down ? "#17a81a" : "#21be2b"
                verticalAlignment: Text.AlignVCenter
                leftPadding: control.indicator.width + control.spacing
            }
        }
    */

    /*
        SwitchDelegate {
            id: control
            text: qsTr("SwitchDelegate")
            checked: true

            contentItem: Text {
                rightPadding: control.indicator.width + control.spacing
                text: control.text
                font: control.font
                opacity: enabled ? 1.0 : 0.3
                color: control.down ? "#17a81a" : "#21be2b"
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }

            indicator: Rectangle {
                implicitWidth: 48
                implicitHeight: 26
                x: control.width - width - control.rightPadding
                y: parent.height / 2 - height / 2
                radius: 13
                color: control.checked ? "#17a81a" : "transparent"
                border.color: control.checked ? "#17a81a" : "#cccccc"

                Rectangle {
                    x: control.checked ? parent.width - width : 0
                    width: 26
                    height: 26
                    radius: 13
                    color: control.down ? "#cccccc" : "#ffffff"
                    border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
                }
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                visible: control.down || control.highlighted
                color: control.down ? "#bdbebf" : "#eeeeee"
            }
        }
    */
}
