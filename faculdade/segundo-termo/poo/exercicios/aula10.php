// AULA DE INTEGRAÇÃO COM BANCO DE DADOS, PHP E HTML

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de exemplo</title>
</head>
<body>
    <h1>Formulário de Exemplo</h1>
    <form action="background.php" method="POST">
        <label for="nome"><strong>Nome:</strong></label><br>
        <input type="text" name="nome" id="nome" required><br>
        <br>
        <label for="email"><strong>E-mail:</strong></label><br>
        <input type="email" name="email" id="email" required><br>
        <br>
        <button type="submit">Enviar</button>
    </form>
</body>
</html>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['nome'];
    $email = $_POST['email'];

    echo "Nome: $name <br><br>";
    echo "E-mail: $email <br><br>";

    $servername = "localhost";
    $username = "root";
    $password = "351220";
    $dbname = "banco01";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: $conn->connect_error <br><br>");
    } else {
        echo "Conexão com o Banco de Dados realizada <br><br>";
    }

    $sql = "INSERT INTO aluno (nome, email) VALUES ('$name', '$email')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $conn->close();
}
?>xml_error_string
