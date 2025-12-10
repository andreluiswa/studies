# Exercicio 1
V1 = int(input("Informe o valor do Metro: "))
V2 = V1 * 100
print(V1 , "metro(s)", "em centímetro(s) é:" , V2)

# Exercicio 2
V1 = float(input("Quanto é o seu salário por hora? "))
V2 = float(input("Quantas horas você trabalha por mês? "))
V3 = V1 * V2
print("Seu salário mensal é:" , V3)

# Exercicio 3
Fahrenheit = int(input("Digite o Valor do Fahrenheit: "))
Celsius = 5 * ((Fahrenheit - 32) // 9)
print("Este Valor em Celsius será:" , Celsius,"°C")

# Exercicio 4
Peso = float(input("Defina o seu Peso (kg): "))
H = float(input("Defina a sua ALtura (m): "))
MassaCorporal = Peso // (H * H)
print("Seu Índice de Massa Corporal (IMC) é:" , MassaCorporal)

# Exercicio 5
SalarioH = float(input("Quanto é o seu salário por hora? "))
HorasMes = float(input("Quantas horas você trabalha por mês? "))
SalarioBruto = SalarioH * HorasMes
ImpRenda = SalarioBruto * 0.11
INSS = SalarioBruto * 0.08
SalarioLiquid = SalarioBruto - ImpRenda - INSS

print(f"Seu Salário Bruto é: {SalarioBruto}")
print(f"Seu Imposto de Renda (IR) é: {ImpRenda}")
print(f"Seu INSS é: {INSS}")
print(f"Seu Salário Líquido é: {SalarioLiquid}")

# Exercicio 6 
Área = float(input ("Área: "))
LitrosTinta = Área / 3
LatasTinta = LitrosTinta / 18
#round() = comando para arredondar
LatasTinta = round(LatasTinta)
PreçoLata = 80
ValorTinta = PreçoLata * LatasTinta
print("Número de latas:", LatasTinta)
print(f"Valor da tinta para pintar uma área de {Área} m²: {ValorTinta}")

# Exercicio 7 (esse eu tava inspirado)
# Cálculo Simples - beecrowd

cod_1,num_1,val_1 = input().split(" ") # Comando "split" serve para "quebrar" a string, assim podendo colocar muitas variaveis em uma única linha de código
cod_2,num_2,val_2 = input().split(" ")

cod_1 = int(cod_1) # cod_1 = int(cod_1) -> converter uma variável para um número inteiro. O mesmo vale para os abaixos com o comando "int"
cod_2 = int(cod_2)
num_1 = int(num_1)
num_2 = int(num_2)
val_1 = float(val_1) # val_1 = float(val_1) -> converter uma variável para um número decimal
val_2 = float(val_2)

soma = (num_1*val_1) + (num_2*val_2)

print(f"VALOR A PAGAR: R$ {soma:.2f}") # formatação para definir que terá apenas DUAS casas decimais, é conhecido como "double"
