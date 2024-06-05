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
    Rectangle {
        id: switchContainer
        width: 200
        height: 50
        color: switchHandle.x > switchContainer.width / 2 ? "#55aa55" : "#aa5555"
        radius: 25

        Text {
            text: switchHandle.x > switchContainer.width / 2 ? "Output" : "Inner"
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea {
            id: dragArea
            anchors.fill: parent

            property int lastX // Добавляем свойство для отслеживания последнего положения по оси X

            onPressed: {
                lastX = switchHandle.x // Запоминаем начальное положение при нажатии
            }

            onReleased: {
                let moveDistance = Math.abs(switchHandle.x - lastX);
                let threshold = switchContainer.width * 0.15; // 15 процентов от ширины контейнера

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
            width: switchContainer.height
            height: switchContainer.height
            radius: height / 2
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            x: 0 // начальное положение слева
            //x:switchContainer.width - switchContainer.height // начальное положение справа

            property real startX: 0 // Сохраняем начальное положение

            Behavior on x {
                NumberAnimation {
                    duration: 300 // продолжительность анимации в миллисекундах
                    easing.type: Easing.InOutQuad // тип плавности анимации
                }
            }
        }
    }
    //----------------------------------------------------------------------------------------------


}
