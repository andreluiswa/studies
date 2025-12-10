# WHILE
# Execicio 1
soma = 0
numero = 0

while numero >= 0:
    numero = int(input("Insira um número inteiro positivo (ou um número negativo para parar): "))
    if numero >= 0:
        soma += numero

print("A soma dos números inseridos é:", soma)

# Exercicio 2
palavra = input("Digite uma palavra qualquer: ")
palavra = palavra.lower()
if palavra == palavra[::-1]:
  print(f"{palvra} é um palíndromo.")
else:
  print(f"{palavra} não é um palíndromo")

# Exercico 3
def eh_primo(num):
  if num <= 1:
    return False
  for i in range(2, int(num**0.5) + 1):
    if num % i == 0:
      return False
  return True

try:
  num = int(input("Insira um número inteiro: "))
  if eh_primo(num):
    print(f"{num} é um Número Primo!")
  else:
    print(f"{num} não é um Número Primo!")
except ValueError:
  print("Entrada inválida. Digite um número inteiro!")

# FOR
# Exercicio 4
nt = []
for i in range(4):
    try:
      nota = float(input(f"Digite a nota da disciplina {i+1}: "))
      if 0 <= nota <= 10:
        nt.append(nota)
      else:
        print("Nota inválida. O valor deve ser entre 0 e 10!!!")
    except ValueError:
      print("Entrada inválida. Digite um número!")

soma = sum(nt)
med = soma / len(nt)

print(f"A média das notas é: {med}")

# Exercicio 5
numero = int(input("Digite um número: "))
for i in range(1,11):
  print(f"{numero} x {i} = {numero * i}")

# Exercicio 6
palavra = input("Digite uma palavra: ")
contar = 0
for i in palavra:
  contar += 1
print(f"O Número de Caracteres é: {contar}")
