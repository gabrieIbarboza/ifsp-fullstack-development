<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 02</title>
    <style>
        .container {background-color: #10a7bb; margin-left: 33%; margin-right: 33%; margin-top: 12vw; padding: 1%}
        h1 {text-align: center; color: black; margin: 0;}
        p {color: #e2ebeb; font-size: 17px}
        h4 {color: #0000ff; text-decoration: underline}
        button {background-color: #d4d4d4; padding-top: 3%; padding-bottom: 3%; margin-right: 13px; border-radius: 10px;}
        h1, button {text-transform: uppercase}
    </style>
</head>

<body>
    <div class="container"> 
        <?php
            echo "<h1>Trilha</h1>";
            echo "<p>Página sobre o jogo <strong>TRILHA</strong> desenvolvido usando as tecnologias <i>PHP, HTML e CSS</i></p>";
            echo "<p>Nesta tela de início de jogo, você poderá escolher uma das opções principais: <strong>Começar o jogo</strong> ou <strong>Como jogar.</strong>";
            echo "<h4>Conheça sobre o jogo na Internet</h4>";
            echo "<br>";
            echo "<button>Começar o Jogo</button>";
            echo "<button>Como Jogar</button>";
        ?> 
    </div>
</body>
</html>