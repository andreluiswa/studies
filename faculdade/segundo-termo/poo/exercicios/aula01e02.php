<?php
// Aula 01
class Pessoa
{
    public $nome;
    private $idade;

    function __construct($nome, $idade)
    {
        $this->nome = $nome;
        $this->idade = $idade;
    }

    function apresentar()
    {
        echo "Meu nome é $this->nome e eu tenho $this->idade anos.";
    }
}

$roberto = new Pessoa("Roberto Carlos", 50);
$roberto->apresentar();
?>

<?php
// Aula 02
    $nome = "Evandro";
    $idade = 28;
    echo "Nome: " . $nome . "\n";
    echo "Idade: " . $idade . "\n";

    if ($idade > 18) {
        echo "Maior de Idade!";
    } else {
        echo "Menor de Idade!";
    }
?>

<?php
// Ativdades práticas - Script
//1. Crie um arquivo PHP que imprima "Olá, Mundo!" na tela.
// Função predefinida 
echo strtoupper("Olá, Mundo!");
echo "\n";

// Defina duas variáveis, atribua valores a elas e imprima a soma dos valores.
echo "\n";
$valor1 = 4;
$valor2 = 9;

$resultado = $valor1 + $valor2;

echo "Valor $valor1 + $valor2 = $resultado";

echo "\n";

$valor = 5;
if ($valor % 2 == 0) {
    echo "Esse número é PAR!";
} else {
    echo "Esse número é ÍMPAR!";
}
?>
