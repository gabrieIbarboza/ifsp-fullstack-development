<?php
$vetor = array();

for ($i = 0; $i < 3; $i++) {
    $vetor[$i] = rand(0, 20);
}

$media = array_sum($vetor) / count($vetor);

$c = array_count_values($vetor);
arsort($c);
$moda = key($c);

sort($vetor);
$size = count($vetor);
if ($size % 2 == 0) {
    $mediana = ($vetor[($size / 2) - 1] + $vetor[$size / 2]) / 2;
} else {
    $mediana = $vetor[$size / 2];
}

echo "Valores no array: " . implode(", ", $vetor) . "<br>";
echo "Média: " . $media . "<br>";
echo "Moda: " . $moda . "<br>";
echo "Mediana: " . $mediana . "<br>";
?>
