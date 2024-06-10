import QtQuick 2.12
import QtQuick.Controls 2.12

/*
//https://doc.qt.io/qt-6/qtquickcontrols-customize.html#customizing-switch
Switch {
    id: control
    //text: qsTr("Switch")
    text: swName

    //-->
    signal handlerIsLeft()
    signal handlerIsRight()
    readonly property int m_radius: 13

    property string swName: ""

    indicator: Rectangle {
        id: switchContainer
        implicitWidth: 48
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: m_radius
        //color: control.checked ? "#17a81a" : "#ffffff"
        //border.color: control.checked ? "#17a81a" : "#cccccc"
        color: control.checked ? "#55aa55" : "#aa5555"
        border.color: control.checked ? "#17a81a" : "#aa5555"

        //-->
        onColorChanged: {
            control.checked ? handlerIsRight() : handlerIsLeft()
        }

        // Handler
        Rectangle {
            id: handler
            x: control.checked ? parent.width - width : 0
            width: 26
            height: 26
            radius: m_radius
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
        }

        Component.onCompleted: {
            control.checked = true;
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        color: control.down ? "white" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
*/


Rectangle {
    id: switchContainer
    //width: 90
    //height: 30 //50
    //radius: 10 //25 //10
    width: widthSwitcher
    height: heightSwitcher
    radius: radiusSwitcher
    //ToDo ...width / 10
    color: (switchHandle.x > switchContainer.width / 10) ? "#55aa55" : "#aa5555"
    //ToDo
    //color: (switchHandle.x > switchContainer.width / 10) ? colorLeftSide : colorRightSide
    onColorChanged: (switchHandle.x > switchContainer.width / 10) ? handlerIsRight() : handlerIsLeft()

    property string txtHandlerLeft: "OFF"
    property string txtHandlerRight: "ON"
    property var widthSwitcher: 90
    property var heightSwitcher: 30
    property var radiusSwitcher: 10
    property bool isStartPositionLeft: true

    // Порог срабатывания, после которого Handler переместиться
    // в противоположную сторону автоматически
    // или вернется в исходное положение, если порог не достигнут.
    // От 0 до 1 - где 0 означает отмену этой функции
    // и Handler переместиться в противоположную сторону сразу
    // тестировано на 0.05 ... 0.2 ... 0.3
    property real valueThreshold: 0.05

    //ToDo при разных размерах widthSwitcher нужны свои коэффициенты
    //switchContainer.width / 10
    //valueThreshold: 0.05

    //ToDo
    //property var colorLeftSide: "#aa5555"
    //property var colorRightSide: "#55aa55"

    signal handlerIsRight()
    signal handlerIsLeft()

    readonly property int widthHandler: Math.round(switchContainer.width * 0.78)


    //-->version1        Text {
    //            text: switchHandle.x > switchContainer.width / 2 ? "Output" : "Inner"
    //            anchors.centerIn: parent
    //            color: "white"
    //        }

    MouseArea {
        id: dragArea
        anchors.fill: parent

        property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

        onPressed: {
            lastX = switchHandle.x // Запоминаем начальное положение при нажатии
        }
        //ToDo need test on biggest size switchContainer.width
        // возвращается ли на место хэндлер при малом перемещении, менее 15 процентов
        onClicked: {
            switchHandle.x = (mouseX < switchContainer.width/2) ? 0 : (switchContainer.width - switchHandle.width)
        }

        onReleased: {
            let moveDistance = Math.abs(switchHandle.x - lastX);
            let threshold = switchContainer.width * valueThreshold; // ... процентов от ширины контейнера

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
        //width: 70 // при switchContainer.width === 90 // Измененная ширина для продолговатой формы
        width: widthHandler
        //height: switchContainer.height - 10
        height: switchContainer.height - 2 // Высота меньше, чтобы вписаться в контейнер
        //radius: 10 // Меньшее скругление углов
        radius:radiusSwitcher
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        //x: 0 // Начальное положение слева
        x: isStartPositionLeft ? 0 : (switchContainer.width - switchHandle.width)
        //x:switchContainer.width - switchContainer.height // начальное положение справа

        property real startX: 0 // Сохраняем начальное положение

        //border.color: "black"
//        gradient: Gradient {
//            orientation: Gradient.Vertical
//            GradientStop { position: 0.9; color: "#434343" }
//            GradientStop { position: 0.6; color: "#434343" }
//        }

        Behavior on x {
            NumberAnimation {
                duration: 300 // продолжительность анимации в миллисекундах
                easing.type: Easing.InOutQuad // тип плавности анимации
            }
        }

        //version2
        Text {
            //text: parent.x > switchContainer.width / 2 ? "Вкл" : "Выкл"
            //text: parent.x > switchContainer.width / 10 ? "Вкл" : "Выкл"
            text: parent.x > switchContainer.width / 10 ? txtHandlerRight : txtHandlerLeft
            anchors.centerIn: parent
            color: "black"
        }
    }

}
/**/


