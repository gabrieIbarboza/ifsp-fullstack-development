<?php
    $c1 = $_REQUEST["slcCondition1"];
    $c2 = $_REQUEST["slcCondition2"];
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado Exercicio 1</title>
</head>
<body>
<?php
    if($c1 == "faixaokay" || "faixaerrado")
    {
        if($c1 == "faixaokay" && $c2 == "semaforookay")
        {
            echo "Você pode atravessar a rua!";
        }
        else {
            echo "Você não pode atravessar a rua!";
        }
    }
    else {
        $c3 = $_REQUEST["slcCondition3"];
        if($c1 == "cintookay" && $c2 == "alcoolokay" && $c3 == "semaforookay")
        {
            echo "Você pode dirigir!";
        }
        else {
            echo "Você não pode dirigir!";
        }
    }
?>
</body>
</html>