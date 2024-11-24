from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/executar', methods=['POST'])
def executar_script():
    """
    Endpoint para executar um script Python com base no parâmetro recebido.
    """
    data = request.json  # Captura o JSON enviado na requisição
    if not data or 'parametro' not in data:
        return jsonify({'status': 'erro', 'mensagem': 'Parâmetro não fornecido!'}), 400

    try:
        # Executa o script Python com o parâmetro recebido
        parametro = data['parametro']
        resultado = subprocess.check_output(
            ['python', 'meu_script.py', parametro],
            text=True
        )
        return jsonify({'status': 'sucesso', 'resultado': resultado})
    except subprocess.CalledProcessError as e:
        # Captura erros do script Python
        return jsonify({'status': 'erro', 'mensagem': f"Erro ao executar script: {e.output.strip()}"}), 500
    except Exception as e:
        # Captura outros erros
        return jsonify({'status': 'erro', 'mensagem': str(e)}), 500

if __name__ == '__main__':
    # Configuração para aceitar conexões externas
    app.run(debug=True, host='192.168.18.11')
