<?php
  if (!defined('STDIN')) {
    if (!isset($_SERVER['HTTP_REFERER']) || strpos($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) === false) {
        header("Location: ../../../index.html");
    }
  }

  session_start();

  include_once "../../server/levels.php";

  $valorDado = rand(1, 20);

  if($valorDado <= 10) {
    $redirecionamento = "../final/CTB_00112A.php";
  }
  else {
    $redirecionamento = "../final/CTB_00112B.php";
  }

  $storyFile = fopen(CTB_112, "r") or die("Unable to open file!");
  $storyText = fread($storyFile,filesize(CTB_112));
  fclose($storyFile);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../estilo/css.css">
    <link rel="icon" href="../../../imagens/eco.png">
    <title>EcoMundo</title>
</head>
<body class="body_3">
    <h1>Contrabandista</h1>
    <div class="txt_historia">
      <?php echo $storyText; ?>
    </div>
    <br><br>
    <div class="box-Container">
        <button id="btnLancarDado">
          <img src="../../../imagens/dado.png" alt="Dado">
          <div id="displayNumber">
            Número gerado no Dado: <?php echo "$valorDado";?>
          </div>
        </button>
    </div>
    <form action="<?php echo $redirecionamento ?>" method="post">
      <div class="box-Container">
        <button id="btnContinuar" type="submit" class="off" disabled>Continuar...</button>
      </div>
    </form>
    <script src="../../scripts/script.js"></script>
</body>
</html>