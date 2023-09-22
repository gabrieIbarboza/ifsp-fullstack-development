<?php
/* Pagina de úsuario logado */
//criando a session
session_start();

if(isset($_SESSION['usuario']))
{
  //Salvando data e hora do login
  include_once "encerramento.php";

  //use seu nome como usuário e o prontuário como senha para realizar o login
  echo "Nome: " . $_SESSION["usuario"] . ".<br>";

  echo "<hr>";
  echo "Preferências do usuário:";
  echo "<hr>";
  echo "Filme= " . $_SESSION["filme"] . ".<br>";
  echo "Música= " . $_SESSION["musica"] . ".<br>";
  echo "Livro= " . $_SESSION["livro"] . ".<br>";

  //Encerrar as sessões destruindo todos os dados.
  session_destroy();
  echo "<hr>";
}
else
{
  header("Location: index.php");
  exit;
}
?>
