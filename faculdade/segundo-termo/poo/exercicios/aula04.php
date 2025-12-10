<?php
class Calculadora
{
    public static $pi = 3.14159;

    public static function somar($a, $b)
    {
        return $a + $b;
    }
}

echo "Valor de Pi: " . Calculadora::$pi . "\n";

printf("Soma: R$ %.2f", Calculadora::somar(9.90, 5.80));
?>

<?php
// EX 01
class Conversor
{
    public static $fator = 0.621371;

    static function converter_km_milhas($km)
    {
        return self::$fator * $km;
    }
}
?>

<?php
// EX 02
class Produto
{
    public $nome;
    private $preco;
    function __construct($nome, $preco)
    {
        $this->nome = $nome;
        $this->preco = $preco;
    }

    function desconto($novo_preco)
    {
        $this->preco = $novo_preco;
        printf("Novo Preço: R$ %.2f \n", $this->preco);
    }

    function __destruct()
    {
        echo "Fim \n";
    }
}

$relogio = new Produto("Relógio Casio", 700);
echo "Produto 1: $relogio->nome \n";
$relogio->desconto(500);

$dell = new Produto("Dell Inspire", 50000);
echo "Produto 2: $dell->nome \n";
$dell->desconto(4000);
?>

<?php
// EX 03
class Aluno
{
    private static $cadastrado;
    private $nome, $idade, $ra, $curso;

    function __construct()
    {
        self::soma_aluno();
    }

    static function soma_aluno()
    {
        self::$cadastrado += 1;
    }

    static function exbibe_total_cadastrado()
    {
        echo "Novos Alunos cadastrados: " . Aluno::$cadastrado;
    }
}

$caio = new Aluno();
$raul = new Aluno();
$evandro = new Aluno();
Aluno::exbibe_total_cadastrado();

echo "1 km é equvalente a " . Conversor::converter_km_milhas(1);
?>
