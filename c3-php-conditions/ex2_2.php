<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INGRESSOS</title>
</head>
<body>
    <?php
        $aluno = $_GET["slcYN"];
        $valor = $_GET["slcValor"];
        
        $ingresso = ($valor == 'normal')? 20.00 : 50.00;
        
        if($aluno == "Sim"){
            $total = $ingresso * 0.50;
            echo "Valor total do ingresso: R$$total";
        }
        else{
            echo "Valor total do ingresso: R$$ingresso";
        }
    ?>
</body>
</html>
