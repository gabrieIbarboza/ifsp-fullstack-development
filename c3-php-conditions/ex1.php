<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $position ?></title>
    <style>
        form {
            background-color: #212269;
            border-radius: 25px;
            display: flex;
            flex-direction: column;
            text-align: left;
            margin: 0 auto;
            padding: 20px;
            width: 300px;
        }

        form label {
            color: aliceblue;
            font-size: 1.2rem;
        }

        form select, input {
            background-color: aliceblue;
            height: 40px;
            margin-top: 10px;
        }

        form select:focus {
            border: solid 2px darkgray;
        }

        form input[type="submit"] {
            background-color: aliceblue;
            border: 0;
            color: #212269;
            font-size: 1.1rem;
            width: 150px;
        }
    </style>
</head>
<body>
    <form action="ex1-final.php" method="get">
        <?php
        $position = $_GET["slcPosition"];
        if($position == "Pedestre")
        {
            echo '
            <label for="slcCondition1">
                Você está na faixa de travessia de pedestre?
            </label>
            <select name="slcCondition1" id="slcCondition1">
                <option value="" disabled selected>Selecione...</option>
                <option value="faixaokay">Sim</option>
                <option value="faixaerrado">Não</option>
            </select>
            <br>
            <label for="slcCondition2">
                O semáforo está vermelho para os carros?
            </label>
            <select name="slcCondition2" id="slcCondition2">
                <option value="" disabled selected>Selecione...</option>
                <option value="semaforookay">Sim</option>
                <option value="semaforoerrado">Não</option>
            </select>
            ';
        }
        else 
        {
            echo '
            <label for="slcCondition1">
                Você está usando cinto de segurança?
            </label>
            <select name="slcCondition1" id="slcCondition1">
                <option value="" disabled selected>Selecione...</option>
                <option value="cintookay">Sim</option>
                <option value="cintoerrado">Não</option>
            </select>
            <br>
            <label for="slcCondition2">
                Você bebeu alguma bebida com teor alcóolico?
            </label>
            <select name="slcCondition2" id="slcCondition2">
                <option value="" disabled selected>Selecione...</option>
                <option value="alcoolerrado">Sim</option>
                <option value="alcoolokay">Não</option>
            </select>
            <br>
            <label for="slcCondition3">
                O semáforo está verde para os carros?
            </label>
            <select name="slcCondition3" id="slcCondition3">
                <option value="" disabled selected>Selecione...</option>
                <option value="semaforookay">Sim</option>
                <option value="semaforoerrado">Não</option>
            </select>
            ';
        }
        ?>
        <input type="submit" value="Responder">
    </form>
</body>
</html>