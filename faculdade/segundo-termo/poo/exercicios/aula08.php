<?php
class Funcionario {
    public function trabalhar(){
        return "O funcionário está trabalhando";
    }
}

class Desenvolvedor extends Funcionario{
    public function trabalhar(){
        return "o desenvolvedor está codificando";
    }
}

class Designer extends Funcionario{
    public function trabalhar(){
        return "O designer está criando designs";
    }
}

// Uso do Polimorfismo 
$funcionarios = [new Desenvolvedor(), new Designer()];
foreach ($funcionarios as $funcionario){
    echo $funcionario->trabalhar() . PHP_EOL;
}
?>

<?php
// Polimorfismo Estático em PHP: Argumentos Variáveis

operador ... (splat operator)
class Calculadora {
    public function somar(...$numeros){
        return array_sum($numeros);
    }
}

$calculo = new Calculadora();
echo $calculo->somar(2,3) . PHP_EOL;
echo $calculo->somar(1,2,3,4) . PHP_EOL;
?>

<?php
Função func_get_args()
class Operacao{
    public function calcular(){
        $args = func_get_args();
        return array_sum($args);
    }
}

$op = new Operacao();
echo $op->calcular(1,2) . PHP_EOL;
echo $op->calcular(1,2,3) . PHP_EOL;
?>

<?php
// Argumentos Opcionais
class Mensagem{
    public function enviar($mensagem, $destinatario = null){
        if ($destinatario){
            return "Enviando mensagem para $destinatario: $mensagem";
        }
        return "Enviando mensagem: $mensagem";
    }
}

$msg = new Mensagem();
echo $msg->enviar("Olá!") . PHP_EOL;
echo $msg->enviar("Olá!!","Evandro") . PHP_EOL;
?>
