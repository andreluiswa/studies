<?php
class Veiculo
{
    public $marca;
    public $modelo;

    public function __construct($marca, $modelo)
    {
        $this->marca = $marca;
        $this->modelo = $modelo;
    }

    public function detalhes()
    {
        return "Marca: $this->marca, Modelo: $this->modelo";
    }
}

class Carro extends Veiculo
{
    public $tipo;

    public function __construct($marca, $modelo, $tipo)
    {
        parent::__construct($marca, $modelo);
        $this->tipo = $tipo;
    }

    public function detalhes()
    {
        return parent::detalhes() . ", Tipo: $this->tipo";
    }
}

$meu_carro = new Carro("Toyota", "Etios", "Sedan");
echo $meu_carro->detalhes();
?>

<?php
// Atividade Prática
class Produto
{
    private $nome;
    private $preco;

    public function __construct($nome, $preco)
    {
        $this->nome = $nome;
        $this->preco = $preco;
    }

    public function detalhesProduto()
    {
        return "Nome: $this->nome, Preço: $this->preco";
    }
}

class Eletronico extends Produto
{
    protected $garantia;

    public function __construct($nome, $preco, $garantia)
    {
        parent::__construct($nome, $preco);
        $this->garantia = $garantia;
    }

    public function detalhesProduto()
    {
        return parent::detalhesProduto() . ", Garantia: $this->garantia";
    }
}

class Funcionario
{
    protected $nome;
    protected $salario;

    public function __construct($nome, $salario)
    {
        $this->nome = $nome;
        $this->salario = $salario;
    }

    public function detalhesFuncionario()
    {
        return "Nome: $this->nome, Salário: $this->salario";
    }
}

class Gerente extends Funcionario
{
    private $setor;

    public function __construct($nome, $salario, $setor)
    {
        parent::__construct($nome, $salario);
        $this->setor = $setor;
    }

    public function detalhesFuncionario()
    {
        return parent::detalhesFuncionario() . ", Setor: $this->setor";
    }
}

$produto_vendido = new Eletronico("Air Fryer", 1200, "1 Ano");
echo $produto_vendido->detalhesProduto() . "\n";

$funcionario_do_mes = new Gerente("Evandro", 3000, "Bloco 5");
echo $funcionario_do_mes->detalhesFuncionario();
?>
