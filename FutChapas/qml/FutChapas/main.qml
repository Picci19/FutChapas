import QtQuick 2.0
import "content"
import "content/logica.js" as Logic

Row {
    id:mainbar
    property Row mainbar: mainbar
    property bool gameRunning: false
    width: newGameScreen.width
    height: newGameScreen.height
    property var gameState: Logic.newGameState(mainbar);


    Item {
        id: newGameScreen
        width:640
        height:360

        signal startButtonClicked

        //PANTALLA INICIO

        Image {
            source: "content/HomeScreen.png"
            anchors.fill: parent
        }

        Image {
            source: "content/btn_jugar.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 60
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    newGameScreen.startButtonClicked()
                    sound_home.stop()
                    mainbar.state = "stateGameBegins"
                }
            }
        }
        SoundEffect {
            id: sound_home
            source: "content/sound_home.wav"
        }

        Timer {
            interval: 1
            running: true
            onTriggered: sound_home.play()
        }

        //MARCADOR1
        Rectangle{
            id: marcador1
            y: 0
            x: newGameScreen.width*1.43
            width: 50
            height: 50
            color: "red"
            border.color: "black"
            border.width: 5
        }

        //MARCADOR2
        Rectangle{
            id: marcador2
            y: 0
            x: newGameScreen.width*1.51
            width: 50
            height: 50
            color: "red"
            border.color: "black"
            border.width: 5
        }

        //ESCUDOS
        Image{
            id: escudo1
            source: "content/bcn.png"
            y: 0
            x: newGameScreen.width*1.33
            width: 50
            height: 50
        }
        Image{
            id: escudo2
            source:  "content/rea.png"
            y: 0
            x: newGameScreen.width*1.61
            width: 50
            height: 50
        }


        //FLECHA DE VUELTA ATRÁS
        Image {
            id:flecha
            x: newGameScreen.width*1.005
            y:(2*imgGameOn.height)/120
            width: 40
            height: 40

            source:"content/btn_flecha.png"
            MouseArea {
                anchors.fill: flecha
                onClicked: {
                    mainbar.state = ""
                }
            }
        }
    }


    //PANTALLA DE JUEGO

    Image {
        id: imgGameOn
        source: "content/campoH.jpg"
        height:0.87*(newGameScreen.height)
        width:newGameScreen.width
        y: 50

        Image{
            id: imgPorteriaIzq
            y: imgGameOn.height*0.40
            source: "content/arco.png"
        }
        Image{
            id: imgPorteriaDer
            y: imgGameOn.height*0.40
            x: imgGameOn.width*0.95
            source: "content/arco.png"
        }

        //CHAPAS BARCELONA

        Image {
            id: chapa2
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.45
            x: imgGameOn.width*0.05
            source: "content/chapa_barcelona.png"
        }
        Image {
            id: chapa1
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.10
            x: imgGameOn.width*0.2
            source: "content/chapa_barcelona.png"
        }
        Image {
            id: chapa3
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.45
            x: imgGameOn.width*0.2
            source: "content/chapa_barcelona.png"
        }
        Image {
            id: chapa4
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.75
            x: imgGameOn.width*0.2
            source: "content/chapa_barcelona.png"
        }
        Image {
            id: chapa5
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.45
            x: imgGameOn.width*0.35
            source: "content/chapa_barcelona.png"
        }

        //CHAPAS MADRID

        Image {
            id: chapa8
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.45
            x: imgGameOn.width*0.9
            source: "content/chapa_madrid.png"
        }
        Image {
            id: chapa9
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.10
            x: imgGameOn.width*0.75
            source: "content/chapa_madrid.png"
        }
        Image {
            id: chapa10
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.45
            x: imgGameOn.width*0.75
            source: "content/chapa_madrid.png"
        }
        Image {
            id: chapa11
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.75
            x: imgGameOn.width*0.75
            source: "content/chapa_madrid.png"
        }
        Image {
            id: chapa12
            width: imgGameOn.width*0.05
            height: imgGameOn.height*0.1
            y: imgGameOn.height*0.45
            x: imgGameOn.width*0.6
            source: "content/chapa_madrid.png"
        }
    }

    states: [
        State {
            name: ""; // when: gameState.gameOver == false && passedSplash
            PropertyChanges { target: mainbar; x: 0 }
            StateChangeScript { script : {
                    sound_home.play()
                    Logic.stopGame()
                }
            }
        },
        State {
            name: "stateGameBegins"; // when: gameState.gameOver == true
            PropertyChanges { target: mainbar; x: -newGameScreen.width }
            StateChangeScript { script : {
                    sound_home.stop()
                    Logic.startGame()
                }
            }
        }
    ]
    transitions: Transition {
        NumberAnimation { properties: "x,y"; duration: 1000; easing.type: Easing.OutBounce }
    }
}
