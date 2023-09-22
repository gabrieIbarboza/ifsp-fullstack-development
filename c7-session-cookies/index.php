<?php

include_once "encerramento.php";
session_start();

if (isset($_POST['btnEntrar'])) {
    $usuario = $_POST['txtusuario'];
    $senha = $_POST['txtsenha'];

    //use seu nome como usuário e o prontuário como senha para realizar o login
    if ($usuario === 'Gabriel' && $senha === 'gu3042715') {
        $_SESSION['usuario'] = $usuario;
        $_SESSION['senha'] = password_hash('gu3042715', PASSWORD_DEFAULT);
        $_SESSION['filme'] = "Coraline e o Mundo Secreto";
        $_SESSION['musica'] = "Red Socks Pugie";
        $_SESSION['livro'] = "Os Sete Maridos de Evelyn Hugo";

        header("Location: dados_usuario.php");
        exit;
    }

    if (isset($_SESSION['tentativas'])) {
        
        $_SESSION['tentativas']++;
        if($_SESSION['tentativas'] >= 3)
        {
            header("Location: dados.php");
            //echo "<script>alert('Usuário não encontrado, faça cadastro!');</script>";
            exit;
        }
    }
    else {
        $_SESSION['tentativas'] = 1;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <form method="post" action="index.php">
        <h1>Boas-vindas!</h1>
        <label>
            Usuário: <br>
            <input type="text" name="txtusuario" required><br>
        </label>
        <label>
            Senha:<br>
            <input type="password" name="txtsenha" required>
        </label>
        <br>
        <p>
         <input type="submit" value="Entrar" name="btnEntrar">
         <input type="reset" name="txtLimpar" value="Limpar">
        </p>
    </form>
</body>
</html>
