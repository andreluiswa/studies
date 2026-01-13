<?php
    abstract class Funcionario {
        private $nome;
        private $salario;

        abstract function calcularSalario();

        public function getNome(){
            return $this->nome;
        }

        public function setNome($nome){
            $this->nome = $nome;
        }
    }

    class Gerente extends Funcionario{
        function calcularSalario(){
            return "O Salário do Gerente é: R$10.000,00";
        }
    }

    class Assistente extends Funcionario{
        function calcularSalario(){
            return "O Salário do Assistente é: R$5.000,00";
        }
    }

$evandro = new Gerente();
$evandro->setNome("Evandro");
echo $evandro->calcularSalario() . "\n";

$caio = new Assistente();
$caio->setNome("Caio");
echo $caio->calcularSalario() . "\n";
?>

<?php

interface Produtos {
    public function calcularPreco();
    public function exibirDetalhes();
}

class Livro implements Produtos {
    private $descricao;
    private $preco;

    public function __construct($descricao, $preco){
        $this->descricao=$descricao;
        $this->preco=$preco;
    }

    function calcularPreco(){
        return $this->preco;
    }

    function exibirDetalhes(){
        return $this->descricao;
    }
}

class Eletronico implements Produtos{
    private $nome;
    private $custo;

    public function __construct($nome, $custo){
        $this->nome = $nome;
        $this->custo = $custo;
    }

    function calcularPreco(){
        return $this->custo;
    }

    function exibirDetalhes(){
        return $this->nome;
    }
}

$livro = new Livro("Nome do Livro: Segurança Web", "Preço: R$25,00");
echo $livro->exibirDetalhes() , "\n";
echo $livro->calcularPreco() , "\n";

$celular = new Eletronico("Nome do Celular: Poco c65", "Preço: R$800,00");
echo $celular->exibirDetalhes() , "\n";
echo $celular->calcularPreco();
?>


