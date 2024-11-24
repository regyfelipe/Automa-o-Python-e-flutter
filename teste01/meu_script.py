import sys
import pyautogui
import time
import webbrowser

def executar_automacao(parametro):
    if parametro == 'buscar':
        print("Abrindo navegador e buscando no Google...")
        webbrowser.open("https://www.google.com") 
        
        time.sleep(5)
        
        pesquisa = "Automação com PyAutoGUI e Flutter Regy Felipe"
        print(f"Digitando a pesquisa: {pesquisa}")
        
        pyautogui.typewrite(pesquisa, interval=0.1)
        pyautogui.press('enter') 
        print("Pesquisa realizada com sucesso.")
        
        time.sleep(5)
        
        print("Abrindo nova aba e acessando LinkedIn...")
        pyautogui.hotkey('ctrl', 't') 
        time.sleep(2)
        pyautogui.typewrite("https://www.linkedin.com/in/regyfelipe/", interval=0.1)
        pyautogui.press('enter')
        print("LinkedIn acessado com sucesso.")
    else:
        print(f"Comando '{parametro}' não reconhecido.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        parametro = sys.argv[1]
        print(f"Parâmetro recebido: {parametro}")
        executar_automacao(parametro)
    else:
        print("Nenhum parâmetro recebido!")
