<?php
$size = 10;
$even = 0;
$odd = 0;
$vetor = array();

for ($i = 0; $i < $size; $i++) {
    $vetor[$i] = rand(1, 10);
}

foreach ($vetor as $n) {
    ($n % 2) == 0 ? $pares++ : $impares++;
}

echo "Vetor: " . implode(", ", $vetor) . "<br>";
echo "Quantidade de pares: " . $pares . "<br>";
echo "Quantidade de ímpares: " . $impares . "<br>";
?>