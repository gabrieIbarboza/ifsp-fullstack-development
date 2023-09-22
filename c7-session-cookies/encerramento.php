<?php
/* Código para registrar último login no cookie */
$tempoDeExpiracao = time() + 3600; 
$dataHoraLogin = date("Y-m-d H:i:s");
setcookie("last_login", $dataHoraLogin, $tempoDeExpiracao);
?>