# Função lambda para calcular o quadrado de um número
quadrado = lambda x: x * x
print(quadrado(5))

# Calcular o dobro de um número:
dobro = lambda: int(input("Digite um número: ")) * 2
print("O dobro do número é:",dobro())

# Calculando a soma com dois números:
soma = lambda: int(input("Digite o primeiro número: ")) + int(input("Digite o segundo número: "))
resultado = soma()
print("A soma dos números é:", resultado)

# Exercicio 1: Criador de Arquivos
# Pergunte ao usuario se ele deseja criar um arquivo, armazene sua resposta
# Armazene em uma variavel o nome que o usuario deseja colocar no arquivo
# utilizando o loop while, siga criando arquivos até que a resposta do usuario para o primeiro tópico seja não

from pathlib import Path

while True:
  resposta = input("Deseja criar um arquivo? (S/N) ").upper()
  if resposta == "S":
    nome_arquivo = input("Digite o nome do arquivo: ")
    caminho = Path(f"{nome_arquivo}" + ".txt")
    with open(caminho, "w", encoding="utf-8") as arquivo:
      arquivo.write("Arquivo criado!")
      print("Concluído")
  elif resposta == "N":
    print("Foi bom ajudar!")
    break
  else:
    print("Comando não permitido")

# Exercício 2: Armazenar e Ler Dados com Tupla

# Crie uma tupla com alguns dados (por exemplo, nomes e idades)
# Escreva os dados da tupla em um arquivo chamado dados.txt
# Leia os dados do arquivo e exiba-os

pessoas = (("Jean", 29), ("Vito", 27), ("Davy", 40))
with open("pessoas.txt", "w") as arquivo:
  for nome, idade in pessoas:
    arquivo.write(f"{nome},{idade} \n")

with open ("pessoas.txt", "r") as arquivo:
  conteudo = arquivo.readlines()
  print("Dados lidos do arquivo:")
  for linha in conteudo:
    nome, idade = linha.strip().split(",")
    print(f"Nome: {nome}, Idade: {idade}")

# Exercício 3: Filtrar Linhas de arquivo.txt
# Crie um arquivo chamado Música.txt
# Escreva nele a letra da sua música preferida (Não precisa ser a letra inteira, pode ser estrofe ou verso)
# Pergunte ao usuario qual palavra ele deseja procurar na musica
# Mostre na tela todas as linhas onde essa palavra aparece
# Mostre tambem quantas linhas foram encontradas com essa palavra

with open("musica.txt","w") as arquivo:
  arquivo.write("Você me pergunta quem sou \n")
  arquivo.write("Onde estou pra onde eu vou \n")
  arquivo.write("Sou nascido de Deus \n")
  arquivo.write("Oh, Oh, Oh \n")

palavra = input("Digite a palavra que deseja procurar: ")

with open("musica.txt","r", encoding="utf-8") as arquivo:
  contador = 0
  print(f"As linhas com a palavra {palavra} são: ")
  for linha in arquivo:
    if palavra.lower() in linha.lower():
      print(linha.strip())
      contador += 1
  print(f"Foram encontradas {contador} linhas com a palavra {palavra}.")

# Classes
class operação:
  def __init__(self, n1,n2):
    self.n1 = n1
    self.n2 = n2
  def multiplicar(self):
    return self.n1 * self.n2
  def divisao(self):
    return self.n1 / self.n2

op1 = operação(4,2)

print(f"A multiplicação é {op1.multiplicar()}. Divisão é {op1.divisao()}")

#Exercicio 1
class Livro:
  def __init__(self, Titulo, Autor, Ano_Publi):
    self.Titulo = Titulo
    self.Autor = Autor
    self.Ano_Publi = Ano_Publi
  def titulo(self):
    return self.Titulo
  def autor(self):
    return self.Autor
  def ano(self):
    return self.Ano_Publi

infos = Livro("Livro de Python","Evandro","2010")

print(f'o livro chama {infos.titulo()}, o autor é {infos.autor()}, o ano que lançou é {infos.ano()}')

#Exercicio 2
class Produto:
  def __init__(self, nome, preço, quantidade):
    self.nome = nome
    self.preço = preço
    self.quantidade = quantidade
  def info(self):
    return (self.nome, self.preço, self.quantidade)

mostrar = Produto("Pão", "1.20", "10")
print(mostrar.info())

# Exercicio 3
class Retangulo:
  def __init__(self, base, altura):
    self.base = base
    self.altura = altura

  def calcular_area(self):
    return self.base * self.altura

  def calcular_perimetro(self):
    return 2 * (self.base + self.altura)

meu_retangulo = Retangulo(10, 5)
area = meu_retangulo.calcular_area()
perimetro = meu_retangulo.calcular_perimetro()

print(f"A área do retângulo é: {area}")
print(f"O perímetro do retângulo é: {perimetro}")

# Expressão Regular
# Escreva um algoritmo em Python que valide um e-mail.
import re

def validar_email(email):

    regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

    if re.match(regex, email):
        return True
    else:
        return False

email_teste_valido = "teste@exemplo.com"

email_teste_invalido = "teste@exemplo"

if validar_email(email_teste_valido):
    print(f"'{email_teste_valido}' é um e-mail válido.")
else:
    print(f"'{email_teste_valido}' é um e-mail inválido.")

if validar_email(email_teste_invalido):
    print(f"'{email_teste_invalido}' é um e-mail válido.")
else:
    print(f"'{email_teste_invalido}' é um e-mail inválido.")

# Escreva um algoritmo em Python que valide um telefone.
import re

regex_numero = r'(\d{2})\d{5}-\d{4}'

numero = "Meu telefone é (14)98765-432"

resultado = re.search(regex_numero, numero)

if resultado:
    print("Número de telefone válido:",resultado.group())
else:
    print("Número de telefone inválido")

# Escreva um algoritmo em Python que encontre um CPF em um texto.
def encontrar_cpf(texto):
  regex_cpf = r'\d{3}\.\d{3}\.\d{3}-\d{2}'
  match = re.search(regex_cpf, texto)
  if match:
    return match.group(0)
  else:
    return None

texto_com_cpf = "O número de CPF do cliente é 123.456.789-00"
cpf_encontrado = encontrar_cpf(texto_com_cpf)

if cpf_encontrado:
    print("CPF encontrado:", cpf_encontrado)
else:
    print("Nenhum CPF encontrado no texto")

texto_sem_cpf = "Este texto não contém um CPF"
cpf_nao_encontrado = encontrar_cpf(texto_sem_cpf)

if cpf_nao_encontrado:
    print("CPF encontrado:", cpf_nao_encontrado)
else:
    print("Nenhum CPF encontrado no texto")

