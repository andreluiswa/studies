<?php
// CLASSE PESSOA / BASE
class Pessoa {
    protected $nome;
    protected $idade;
    protected $cpf;

    public function __construct($nome, $idade, $cpf) {
        $this->nome = $nome;
        $this->idade = $idade;
        $this->cpf = $cpf;
    }

    public function getNome() {
        return $this->nome;
    }

    public function getIdade() {
        return $this->idade;
    }

    public function getCpf() {
        return $this->cpf;
    }

    public function exibirDadosBasicos() {
        return "Nome: {$this->nome}" . PHP_EOL .
               "Idade: {$this->idade}" . PHP_EOL .
               "CPF: {$this->cpf}" . PHP_EOL;
    }
}

// CLASSE PACIENTE
class Paciente extends Pessoa {
    private $sintomas;
    private $prioridade;

    public function __construct($nome, $idade, $cpf, $sintomas, $prioridade) {
        parent::__construct($nome, $idade, $cpf);
        $this->sintomas = $sintomas;
        $this->prioridade = $prioridade;
    }

    public function getSintomas() {
        return $this->sintomas;
    }

    public function getPrioridade() {
        return $this->prioridade;
    }

    public function exibirDados() {
        return $this->exibirDadosBasicos() .
               "Sintomas: {$this->sintomas}" . PHP_EOL .
               "Prioridade: {$this->prioridade}" . PHP_EOL;
    }
}

// CLASSE FUNCIONARIO
class Funcionario extends Pessoa {
    private $cargo;
    private $registro;

    public function __construct($nome, $idade, $cpf, $cargo, $registro) {
        parent::__construct($nome, $idade, $cpf);
        $this->cargo = $cargo;
        $this->registro = $registro;
    }

    public function getCargo() {
        return $this->cargo;
    }

    public function getRegistro() {
        return $this->registro;
    }

    public function exibirDados() {
        return $this->exibirDadosBasicos() .
               "Cargo: {$this->cargo}" . PHP_EOL .
               "Registro: {$this->registro}" . PHP_EOL;
    }
}

// CLASSE SISTEMA (Gerencia pacientes e funcionários)
class Sistema {
    private $pacientes = [];
    private $funcionarios = [];

    // Cadastrar novo paciente
    public function cadastrarPaciente(Paciente $paciente) {
        $this->pacientes[] = $paciente;
    }

    // Cadastrar novo funcionário
    public function cadastrarFuncionario(Funcionario $funcionario) {
        $this->funcionarios[] = $funcionario;
    }

    // Listar pacientes
    public function listarPacientes() {
        echo "LISTA DE PACIENTES" . PHP_EOL;
        foreach ($this->pacientes as $p) {
            echo $p->exibirDados() . PHP_EOL;
            echo "-----------------------------" . PHP_EOL;
        }
    }

    // Listar funcionários
    public function listarFuncionarios() {
        echo "LISTA DE FUNCIONÁRIOS" . PHP_EOL;
        foreach ($this->funcionarios as $f) {
            echo $f->exibirDados() . PHP_EOL;
            echo "-----------------------------" . PHP_EOL;
        }
    }
}

// TESTE DO SISTEMA
$sistema = new Sistema();

// Cadastra pacientes
$sistema->cadastrarPaciente(new Paciente("Maria Silva", 35, "123.456.789-00", "Febre e dor de cabeça", "Baixa"));
$sistema->cadastrarPaciente(new Paciente("Alexandre Souza", 46, "987.654.321-00", "Dor no peito", "Alta"));
$sistema->cadastrarPaciente(new Paciente("João Lima", 29, "111.222.333-44", "Tosse persistente", "Média"));

// Cadastra funcionários
$sistema->cadastrarFuncionario(new Funcionario("Dr. Carlos Mendes", 42, "999.888.777-66", "Médico", "CRM-12345"));
$sistema->cadastrarFuncionario(new Funcionario("Enfermeira Ana Paula", 30, "444.555.666-77", "Enfermeira", "COREN-6789"));

// Exibir cadastros
$sistema->listarPacientes();
$sistema->listarFuncionarios();
