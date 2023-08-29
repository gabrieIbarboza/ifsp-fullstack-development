<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clube de Festas</title>

    <style>
        form {
            background-color: #212269;
            border-radius: 25px;
            display: flex;
            flex-direction: column;
            text-align: left;
            margin: 0 auto;
            padding: 20px;
            width: 300px;
        }

        form label {
            color: aliceblue;
            font-size: 1.2rem;
            margin: 10px 0;
        }

        .texto {
            color: aliceblue;
            font-size: 1.2rem;
            text-align: center;
        }

        form select, input {
            background-color: aliceblue;
            height: 40px;
            width: 100%;
        }
        form select:focus {
            border: solid 2px darkgray;
        }

        form input[type="submit"] {
            background-color: aliceblue;
            border-radius: 5px;
            border: 0;
            color: #212269;
            font-size: 1.1rem;
            margin-top: 10px;
            width: 150px;
        }
    </style>
</head>
<body>
    <form method="get" action="ex2_2.php">
        <?php
        $nome = isset($_GET["inpName"])? $_GET["inpName"] : nome;
        $idade = isset($_GET["inpAge"])? $_GET ["inpAge"] : 0;

        if($idade >= 18){
            echo "<div class='texto'>Você pode reservar um ingresso para um clube de festas!</div>";
            echo '<label> 
            Seleciona o valor da entrada: 
            </label>
            <select name="slcValor" id="slcValor" required>
                <option value="" disable selected>Selecione o Valor</option>
                <option value="normal"> R$20,00 </option>
                <option value="VIP"> R$50,00 </option>
            </select>
                <label for="slcYN">Você é aluno do IFSP?</label>
            <select name="slcYN" id="slcYN" required>
                <option value="" disabled selected>Selecione a opção</option>
                <option value="Sim">Sim</option>
                <option value="Não">Não</option>
            </select>';
            echo '<input type="submit" value="Enviar"></input>';
            }
        elseif ($idade < 18){
            $tempo = 18 - $idade;
            echo "<h3>Desculpe $nome, faltam $tempo anos para completar 18 anos e poder ir às festas!</h3>";
        }
    ?>

</form>

</body>
</html>

