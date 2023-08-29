<?php
$vetor = array();
for ($i = 0; $i < 10; $i++) {
    $vetor[] = rand(0, 100);
}

sort($vetor);

echo "Ordem Crescente: " . implode(" => ", $vetor) . "<br><br>";

rsort($vetor);

echo "Ordem Decrescente: " . implode(" <= ", $vetor) . "<br>";
?>
