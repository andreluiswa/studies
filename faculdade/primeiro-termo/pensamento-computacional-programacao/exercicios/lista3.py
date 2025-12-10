# Exercicio 1
print("Comparador de PAR ou ÍMPAR")
numero = int(input("Informe um Número: "))
mod = numero % 2
eh_par = mod == 0
print(f"O Número {numero}")
if eh_par:
  print("É considerado par👍👍")
else:
  print("É considerado ímpar👍")

# Exercicio 2
print("Descontos de Valores")
valor_compra = float(input("Insira o Valor Total da Compra: R$ "))
desconto100 = (valor_compra * 0.1)
desconto5 = (valor_compra * 0.05)
valor_final = (valor_compra - desconto100) or (valor_compra - desconto5)
if valor_compra >= 100:
  print(f"Você tem um Desconto de 10%, o Valor Total ficou: {valor_final:.2f}")
else:
  print(f"Você tem um Desconto de 5%, o Valor Total ficou: {valor_final:.2f}")

# Exercicio 3
print("Classificador de Idade")
idade = float(input("Informe a sua Idade: "))
if idade <= 12:
  print("Você é uma Criança!")
elif idade <= 17:
  print("Você é um Adolescente!")
elif idade <=59:
  print("Você tem que pagar boleto e convênio médico 😱")
else:
  print("Você é um idoso! Já pode visitar o asilo 😎")
  
# Exercicio 4
print("Verificador de Triângulo")
lado1 = float(input("Digite o comprimento do primeiro lado: "))
lado2 = float(input("Digite o comprimento do segundo lado: "))
lado3 = float(input("Digite o comprimento do terceiro lado: "))
if lado1 == lado2 == lado3:
  print("É um triângulo EQUILATERO😮")
elif lado1 == lado2 or lado1 == lado3 or lado2 == lado3:
  print("É um triângulo ISÓCELES🤓")
else:
  print("É um triângulo ESCALENO☠️")
  
# Exercicio 5
print("Verificador de Notas")
nota = float(input("Informe sua Nota: "))
if nota <= 100 and nota >= 90:
  print("Você tirou um A 👍")
elif nota <= 89 and nota >= 80:
  print("Você tirou um B 👍")
elif nota <= 79 and nota >= 70:
  print("Você tirou um C 👍")
elif nota <= 69 and nota >= 60:
  print("Você tirou um D 👎")
elif nota <= 59 and nota >= 50:
  print("Você tirou um E 👎")
elif nota <= 49 and nota >= 0:
  print("Você tirou F 👎")
