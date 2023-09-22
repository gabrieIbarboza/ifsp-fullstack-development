<?php
/* Pagina de Cadastro */
session_start();

if (isset($_POST['btnCadastrar'])) {
    $_SESSION['usuario'] = $_POST['txtNovoUsuario'];
    $_SESSION['senha'] = password_hash($_POST['txtNovaSenha'], PASSWORD_DEFAULT);
    $_SESSION['filme'] = $_POST['txtfilme'];
    $_SESSION['musica'] = $_POST['txtmusica'];
    $_SESSION['livro'] = $_POST['txtlivro'];
    
    header("Location: dados_usuario.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Usuário</title>
</head>
<body>
    <h1>Cadastro de Usuário</h1>
    <form method="post" action="dados.php">
        <label>Novo Usuário:</label>
          <input type="text" name="txtNovoUsuario" required><br><br>

        <label>Nova Senha:</label>
          <input type="password" name="txtNovaSenha" required><br><br>

        <label>Filme favorito:</label>
          <input type="text" name="txtfilme" required><br><br>

        <label>Música favorita:</label>
          <input type="text" name="txtmusica" required><br><br>
        
        <label>Livro favorito:</label>
          <input type="text" name="txtlivro" required><br><br>

        <input type="submit" value="Cadastrar" name="btnCadastrar">
    </form>
</body>
</html>
