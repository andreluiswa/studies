# Exercicio 1
Idade = int(input("Informe a sua idade: "))
Mínimo = 18
pode_dirigir = Idade >= Mínimo
print("Você pode dirigir?", pode_dirigir)

# Exercicio 2
Aluno1 = int(input("Informe a Nota do Primeiro Aluno: "))
Aluno2 = int(input("Informe a Nota do Segundo Aluno: "))
melhor_desempenho = Aluno1 > Aluno2
print("O Primeiro Aluno teve um Desempenho Melhor que o Segundo Aluno?", melhor_desempenho)

# Exercicio 3
Senha_Digitada = input("Digite a Senha: ")
Senha_Registrada = "senha1234"
senha_incorreta = Senha_Digitada != Senha_Registrada
print("Senha totalmente incorreta!", senha_incorreta)

# Exercicio 4
Temperatura = input ("Digite a Temperatura: ")
Temperatura = int(Temperatura)
if (Temperatura >= 20) and (Temperatura <= 25) :
    print("Temperatura está no intervalo")
else:
    print("Temperatura não está no intervalo")

# Exercicio 5
compra = int(input("Informe o valor do produto: "))
saldo_disponivel = 3500
pode_comprar = compra <= saldo_disponivel
print("Você pode comprar 👍", pode_comprar)
