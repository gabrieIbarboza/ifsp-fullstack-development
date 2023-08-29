<?php

    $weight = $_GET["inpWeight"];
    $height = $_GET["inpHeight"];
    $imc = $weight / ($height ** 2);

    echo "O seu IMC é " . number_format($imc, 2);
    echo "<br>";
    echo "Você foi classificado como: ";

    if($imc < 18.5)
    {
        echo "Magreza";
    }
    else if($imc < 25) {
        echo "Saudável!";
    }
    else if($imc < 30) {
        echo "Sobrepeso";
    }
    else if($imc < 35) {
        echo "Obesidade Grau I";
    }
    else if($imc < 40) {
        echo "Obesidade Grau II (Severa)";
    }
    else {
        echo "Obesidade Grau III (Mórbida)";
    }

?>