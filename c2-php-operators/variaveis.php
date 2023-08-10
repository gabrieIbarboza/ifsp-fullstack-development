<?php
/**
 * TIPOS DE DADOS 
 */
echo "<h1>AULA 01: Variáveis, tipos de dados, comentários e especificidades.</h1>";
echo "<hr>";
//TIPO STRING 
$nome = "Elena Dias";
echo $nome;
echo "<br>";

//TIPO INTEIRO
$idade = 18;
echo $idade;

//TIPO FLOAT
$altura = 1.70;
echo "<br>";
echo "Altura: $altura";

//TIPO BOOLEAN
$maior = true;
echo "<br>$maior<br>";

//TIPO ARRAY
$linguagens = ["PHP", "C", "JavaScript", "C#","Python", "Ruby"];
echo "LINGUAGENS CONHECIDAS: $linguagens[0], $linguagens[1], $linguagens[2]";
echo "<br>";
foreach ($linguagens as $prog) {
   echo " - $prog<br>";
}

//TIPO NULL
$pagamento = NULL;
echo "Pagamento: $pagamento";

//TIPO OBJETO
class Pessoa {
  public $nome;
  public $idade;
  public function __construct($nome, $idade) {
    $this->nome = $nome;
    $this->idade = $idade;
  }
  public function exibirDados() {
    return "Nome: " . $this->nome . "<br>Idade:  " . $this->idade . "!";
  }
}

$pessoa1 = new Pessoa("Paulo Dias", 25);
echo $pessoa1 -> exibirDados();
echo "<br>";
$pessoa2 = new Pessoa("Simone Bento da Silva", 26);
echo $pessoa2 -> exibirDados();

?>