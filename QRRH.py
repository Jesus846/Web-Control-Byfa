from flask import Flask, render_template, request, send_from_directory, flash, redirect, url_for
import qrcode
import os

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Necesario para usar flash messages

# Directorio donde guardaremos los QR generados en la carpeta estática
STATIC_FOLDER = 'static/QR_ASISTENCIA'
if not os.path.exists(STATIC_FOLDER):
    os.makedirs(STATIC_FOLDER)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        nombre = request.form.get('nombre')
        area = request.form.get('area')
        sueldo = request.form.get('sueldo')

        if not nombre or not area or not sueldo:
            flash('Todos los campos son obligatorios', 'error')
            return redirect(url_for('index'))

        # Crear el contenido del código QR
        contenido_qr = f'{nombre},{area},{sueldo}'
        nombre_archivo = f'{STATIC_FOLDER}/{nombre}.png'
        
        # Generar el código QR
        qr_img = qrcode.make(contenido_qr)
        qr_img.save(nombre_archivo)

        # Mostrar la imagen en la página
        qr_image = url_for('static', filename=f'QR_ASISTENCIA/{nombre}.png')
        return render_template('index.html', qr_image=qr_image, filename=f'{nombre}.png')

    return render_template('index.html')

@app.route('/download/<filename>')
def download(filename):
    # Asegúrate de que 'filename' está en la carpeta 'static/QR_ASISTENCIA'
    # Esto le dice a Flask que sirva el archivo como descarga
    return send_from_directory(STATIC_FOLDER, filename, as_attachment=True, mimetype='image/png')

if __name__ == '__main__':
    app.run(debug=True)