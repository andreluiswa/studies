<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de exemplo</title>
</head>
<body>
    <h1>Formulário de Exemplo</h1>
    <form action="processa_forms.php" method="POST">
        <label for="nome"><strong>Nome:</strong></label><br>
        <input type="text" name="nome" id="nome" required><br>
        <br>
        <label for="email"><strong>E-mail:</strong></label><br>
        <input type="text" name="email" id="email" required><br>
        <br>
        <label for="senha"><strong>Senha:</strong></label><br>
        <input type="password" name="senha" id="senha" minlength="6" required><br>
        <br>
        <label for="confirmar"><strong>Confirmação de Senha:</strong></label><br>
        <input type="password" name="confirmar" id="confirmar" minlength="6" required><br>
        <br>
        <label for="data"><strong>Data de Nascimento:</strong></label><br>
        <input type="date" name="data" id="data" placeholder="dd/mm/aaaa" required><br>
        <br>
        <button type="submit">Enviar</button>
    </form>
</body>
</html>
---------------------------------------------------------------------------------------------------------------------------------------------------------------
<?php
$nome = $_POST['nome'] ?? '';
$email = $_POST['email'] ?? '';
$senha = $_POST['senha'] ?? '';
$confirmar_senha = $_POST['confirmar'] ?? '';
$data_nascimento = $_POST['data'] ?? '';

if (empty($nome) || empty($email) || empty($senha) || empty($confirmar_senha) || empty($data_nascimento)) {
    die("Preencha todos os campos!!!");
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("E-mail inválido! Tente novamente!");
}

if ($senha !== $confirmar_senha) {
    die("As senhas não são iguais! Tente novamente!");
}
if (strlen($senha) < 6) {
    die("A senha precisa ter pelo menos 6 caracteres!");
}

echo "<h3>Cadastro realizado com sucesso!</h3>";
echo "<p><strong>Nome:</strong> $nome</p>";
echo "<p><strong>E-mail:</strong> $email</p>";
echo "<p><strong>Data de nascimento:</strong> $data_nascimento</p>";
?>
