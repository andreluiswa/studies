# Crie um algoritmo que valide o cadastro de um novo jogador no jogo. As regras são:
# - O nome do jogador não pode estar vazio.
# - A idade deve ser maior ou igual a 12 anos.
# - A senha deve ter pelo menos 8 caracteres.
# - O nome do jogador não pode conter espaços.
# O algoritmo deve exibir mensagens indicando se o cadastro foi bem-sucedido ou qual erro foi encontrado.

def validar_cadastro():
    nome = input("Digite o nome do jogador: ")
    if not nome:
        print("Erro: O nome do jogador não pode estar vazio.")
        return

    if " " in nome:
        print("Erro: O nome do jogador não pode conter espaços.")
        return

    try:
        idade = int(input("Digite a idade do jogador: "))
        if idade < 12:
            print("Erro: A idade deve ser maior ou igual a 12 anos.")
            return
    except ValueError:
        print("Erro: A idade deve ser um número inteiro.")
        return

    senha = input("Digite a senha do jogador: ")
    if len(senha) < 8:
        print("Erro: A senha deve ter pelo menos 8 caracteres.")
        return

    print("Cadastro realizado com sucesso!")

validar_cadastro()

# Crie um algoritmo que determine o nível do jogador com base em sua experiência. O sistema de níveis funciona assim:
# - Se o jogador tem menos de 1000 pontos de experiência, está no nível 1.
# - De 1000 a 5000 pontos, está no nível 2.
# - De 5001 a 10.000 pontos, está no nível 3.
# - Acima de 10.000 pontos, está no nível máximo.
# O programa deve solicitar a quantidade de experiência e exibir o nível correspondente

print("Verificador de Nível de Jogador")
lvl = float(input("Informe o seus Pontos de Experiência (EXP): "))
if lvl < 1000:
  print("Você está no Nível 1")
elif lvl >= 1000 and lvl <= 5000:
  print("Você está no Nível 2")
elif lvl >= 5001 and lvl < 10000:
  print("Você está no Nível 3")
else:
  print("Você está no Nível Máximo!")

# Crie um algoritmo para determinar o vencedor de uma batalha entre dois jogadores. O cálculo é baseado na força do ataque e defesa de cada jogador. As regras são:
# - Cada jogador deve ter um valor de ataque e um valor de defesa.
# - O dano causado é ataque - defesa do adversário.
# - Se o dano for maior que zero, o adversário perde pontos de vida.
# - Se os pontos de vida de um jogador chegarem a zero, ele perde a batalha.
# O programa deve pedir os valores de ataque, defesa e pontos de vida dos jogadores e indicar quem venceu a batalha.

atk1 = int(input("Informe o Ataque do Player 1: "))
defs1 = int(input("Informe a Defesa do Player 1: "))
hp1 = int(input("Informe o HP do Player 1: "))

atk2 = int(input("Informe o Ataque do Player 2: "))
defs2 = int(input("Infome a Defesa do Player 2: "))
hp2 = int(input("Informe o HP do Player 2: "))

damage = atk1 - defs2

if damage < 0:
  damage - hp2
elif hp2 == 0:
  print("Player 1 Venceu!")

# Em um jogo multiplayer, os jogadores podem receber recompensas diárias ao fazer login.
# As regras são:
# - Se o jogador faz login todos os dias consecutivos, recebe +50 moedas.
# - Se o jogador não fez login no dia anterior, recebe +10 moedas apenas.
# - Se é o sétimo dia seguido de login, recebe um bônus extra de 100 moedas.
# Crie um algoritmo que receba como entrada se o jogador fez login ontem (True ou False) e
# quantos dias seguidos ele já logou. O programa deve calcular e exibir a recompensa
# recebida.

def calcular_recompensa(login_ontem, dias_seguidos):
  """Calcula a recompensa diária de um jogador.

  Args:
    login_ontem: True se o jogador fez login ontem, False caso contrário.
    dias_seguidos: Número de dias consecutivos de login.

  Returns:
    A recompensa em moedas.
  """

  if login_ontem:
    recompensa = 50
    if dias_seguidos == 6:
      recompensa += 100
  else:
    recompensa = 10

  return recompensa

# Exemplo de uso
login_ontem = True
dias_seguidos = 5
recompensa = calcular_recompensa(login_ontem, dias_seguidos)
print(f"A recompensa do jogador é: {recompensa} moedas")

login_ontem = False
dias_seguidos = 1
recompensa = calcular_recompensa(login_ontem, dias_seguidos)
print(f"A recompensa do jogador é: {recompensa} moedas")

login_ontem = True
dias_seguidos = 6
recompensa = calcular_recompensa(login_ontem, dias_seguidos)
print(f"A recompensa do jogador é: {recompensa} moedas")

