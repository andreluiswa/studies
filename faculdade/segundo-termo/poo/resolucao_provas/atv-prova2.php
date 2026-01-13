<?php

//Trabalho Intermediário de Programação Orientada a Objetos em PHP (Atividade P2)

//André Luís Gomes dos Santos Filho

//Análise e Desenvolvimento de Sistemas - UNIMAR (2A)

// Tentei deixar bem estruturado e com comentários especificando a resolução do que foi pedido na atividade

//1. Uma interface Cadastro com um método cadastrar().
interface Cadastro {
    public function cadastrar();
}

// 2. Uma classe Vaga que implementa Cadastro, permitindo criar uma vaga de emprego e associar profissionais aplicados.
class Vaga implements Cadastro {
    private $titulo;
    private $descricao;
    private $profissionais = [];

    public function __construct($titulo, $descricao) {
        $this->titulo = $titulo;
        $this->descricao = $descricao;
    }

    public function cadastrar() {
        echo "Vaga '$this->titulo' cadastrada com sucesso!" . "\n";
    }

    public function aplicar(Profissional $p) {
        $this->profissionais[] = $p;
        // Usando getter para acessar o nome do profissional (respeitando encapsulamento)
        echo "{$p->getNome()} aplicou para a vaga '$this->titulo'." . "\n";
    }

    public function listar() {
        echo "\n" . "Profissionais aplicados na vaga '$this->titulo':" . "\n";
        foreach ($this->profissionais as $p) {
            $p->exibirInformacoes();
        }
    }
}

// 3. Uma classe abstrata Pessoa com atributos protegidos (protected) e um método abstrato exibirInformacoes().
abstract class Pessoa {
    protected $nome;
    protected $email;
    protected $telefone;

    public function __construct($nome, $email, $telefone) {
        $this->nome = $nome;
        $this->email = $email;
        $this->telefone = $telefone;
    }

    // Getter para permitir acesso ao nome fora da classe (respeitando encapsulamento)
    public function getNome() {
        return $this->nome;
    }

    abstract public function exibirInformacoes();
}

// 4. Uma classe Profissional que estende Pessoa, implementando o método exibirInformacoes() e permitindo aplicar em uma vaga.
class Profissional extends Pessoa {
    private $areaDeAtuacao;

    public function __construct($nome, $email, $telefone, $areaDeAtuacao) {
        parent::__construct($nome, $email, $telefone);
        $this->areaDeAtuacao = $areaDeAtuacao;
    }

    public function exibirInformacoes() {
        echo "Nome: $this->nome" . "\n";
        echo "Email: $this->email" . "\n";
        echo "Telefone: $this->telefone" . "\n";
        echo "Área de Atuação: $this->areaDeAtuacao" . "\n";
    }
}

// Requisitos para Pontuação
$vaga = new Vaga("Desenvolvedor Web", "Atuar na criação e manutenção de sites." . "\n");
$vaga->cadastrar();

$prof1 = new Profissional("André Santos", "andre@email.com", "(14) 99999-9999", "Programador" . "\n");
$prof2 = new Profissional("Maria Silva", "maria@email.com", "(14) 98888-8888", "Designer" . "\n");

$vaga->aplicar($prof1);
$vaga->aplicar($prof2);

$vaga->listar();

echo "\n" ."Fim da listagem de profissionais.";
