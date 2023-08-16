<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $position ?></title>
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