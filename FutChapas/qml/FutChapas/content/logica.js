.pragma library
.import QtQuick 2.0 as QQ

var gameState;

function getGameState() { return gameState; }


function newGameState(mainbar)
{
    gameState = mainbar;

    return gameState;
}



function startGame() {
    gameState.gameRunning=true;
}

function stopGame() {
    gameState.gameRunning=false;
}
