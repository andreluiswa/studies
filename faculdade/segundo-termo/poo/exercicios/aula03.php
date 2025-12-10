<?php
class Carro
{
    public $placa;
    public $num_chassi;

    function __construct($placa, $num_chassi)
    {
        $this->placa = $placa;
        $this->num_chassi = $num_chassi;
    }

    function acelerar($velocidade)
    {
        echo "Placa: $this->placa - Velocidade: $velocidade km/h \n";
    }

}

$meu_carro = new Carro("PLACA 1PHP", "ABCD123");
$meu_carro->acelerar(60);
$meu_carro = new Carro ("PLACA 2PHP", "EFGH456");
$meu_carro->acelerar(80);
?>

<?php
// Exercicios Extras
//EX 01
class Livro
{
    public $titulo;
    public $autor;
    public $paginas;

    function __construct($titulo, $autor, $paginas)
    {
        $this->titulo = $titulo;
        $this->autor = $autor;
        $this->paginas = $paginas;
    }

    function resumo($resumo)
    {
        echo "Titulo: $this->titulo - Autor: $this->autor - Paginas: $this->paginas - Resumo do Livro: $resumo \n";
    }
}

$meu_livro = new Livro("Minha história com minha filha em 13 dicas de superação.", "Evandro P. de O.", 50);
$meu_livro->resumo("O livro sobre a miha história com a minha filha e, além disso, dicas de superação.");
$meu_livro = new Livro("Seurança de Dados", "Evandro P. de O.", 200);
$meu_livro->resumo("Livro didático sobre como a segurança de dados é importante.");
?>

<?php
// EX 02
class Funcionario
{
    private $rg, $cpf, $data_nascimento, $cargo;
    public $nome, $salario;

    public function promocao($indice)
    {
        $this->salario = $this->salario * $indice;
    }

    public function exibe_salario()
    {
        echo "$this->nome, novo salário: $this->salario";
    }
}

$funcionario_1 = new Funcionario();
$funcionario_1->nome = "Evandro";
$funcionario_1->salario = 10000.00;
$funcionario_1->promocao(1.10); // 10% de aumento
$funcionario_1->exibe_salario();
?>

<?php
// EX 03
class Conta
{
    private $saldo;
    function __construct($saldo_inicial)
    {
        $this->saldo = $saldo_inicial;
    }
    function depositar($deposito)
    {
        $this->saldo = $this->saldo + $deposito;
    }
    function sacar($saque)
    {
        if ($this->saldo >= $saque) {
            $this->saldo = $this->saldo - $saque;
        } else {
            echo "Saldo Insuficiente \n";
        }
    }
    function getSaldo()
    {
        printf("R$ %.2f \n", $this->saldo);
    }
}

$conta_universitaria = new Conta(1000);
$conta_universitaria->getSaldo();
$conta_universitaria->depositar(1000);
$conta_universitaria->getSaldo();
$conta_universitaria->sacar(10000);
$conta_universitaria->sacar(1000);
?>
