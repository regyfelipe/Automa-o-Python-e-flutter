# Automação com Python, Flask e Flutter

Este projeto demonstra como integrar automações criadas em Python com uma aplicação Flutter, utilizando Flask como intermediário para realizar chamadas HTTP. Ele inclui funcionalidades de automação com **PyAutoGUI**, como simulação de movimentos do mouse, entrada de teclado, capturas de tela, e busca automatizada no navegador.

---

## Funcionalidades

### 1. Automação com PyAutoGUI
- Movimentar o mouse e clicar em posições específicas.
- Digitar texto automaticamente em campos ativos.
- Fazer capturas de tela e salvá-las no sistema.
- Abrir o navegador e realizar buscas automáticas no Google.

#### Código de Automação
Abaixo está o código Python utilizado para as automações com PyAutoGUI:

```python
import sys
import pyautogui
import time

def executar_automacao(parametro):
    if parametro == 'mouse':
        # Mover o mouse para uma posição específica
        print("Movendo o mouse para (100, 100)...")
        pyautogui.moveTo(100, 100, duration=1)
        print("Clique no ponto (100, 100)...")
        pyautogui.click()
        print("Automação de mouse concluída.")
    elif parametro == 'teclado':
        # Digitar uma mensagem em um campo ativo
        print("Digitando uma mensagem...")
        pyautogui.typewrite("Automação com PyAutoGUI!", interval=0.1)
        pyautogui.press('enter')
        print("Mensagem digitada.")
    elif parametro == 'screenshot':
        # Fazer uma captura de tela
        print("Fazendo captura de tela...")
        screenshot = pyautogui.screenshot()
        screenshot.save('screenshot.png')
        print("Captura de tela salva como 'screenshot.png'.")
    else:
        print(f"Comando '{parametro}' não reconhecido.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        parametro = sys.argv[1]
        print(f"Parâmetro recebido: {parametro}")
        executar_automacao(parametro)
    else:
        print("Nenhum parâmetro recebido!")





### 2. Integração via API
- Um servidor Flask fornece uma API REST para receber comandos da aplicação Flutter.
- O servidor executa scripts Python de acordo com os comandos enviados pelo Flutter.

- mudança de paramelhor  await executarScript('buscar').

### 3. Interface Mobile
- A aplicação Flutter permite selecionar comandos para executar as automações.

---

## Tecnologias Utilizadas

### Backend
- **Python 3.9+**
- **Flask** - Para criação da API REST.
- **PyAutoGUI** - Para automação do mouse, teclado e captura de tela.
- **Subprocess** - Para execução de scripts Python.

### Frontend
- **Flutter** - Para criação da interface do aplicativo.

---

## Como Configurar o Projeto

### Pré-requisitos
- **Python 3.9+**
- **Flutter SDK** configurado (verifique usando `flutter doctor`).
- Dependências do Python instaladas:
  ```bash
  pip install flask pyautogui
