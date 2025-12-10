<?php
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
