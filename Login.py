from flask import Flask, render_template, request, redirect, url_for, session, flash
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash

# Conexión a la base de datos
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="byfa_control"
)
cursor = conn.cursor()

# Crear la aplicación Flask
app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Necesario para usar sesiones

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contrasena = request.form['contrasena']

        if usuario and contrasena:
            # Seleccionar usuario y contraseña de la base de datos
            cursor.execute("SELECT * FROM usuarios WHERE Usuario = %s", (usuario,))
            resultado = cursor.fetchone()

            if resultado:
                # Obtener la contraseña directamente (sin hashing)
                stored_password = resultado[3]  # Suponiendo que la contraseña está en la columna 3

                # Comparar la contraseña directamente con la almacenada en la base de datos
                if stored_password == contrasena:
                    cargo = resultado[4]  # Suponiendo que el cargo está en la columna 4

                    session['usuario'] = usuario  # Guardamos el usuario en la sesión
                    session['cargo'] = cargo  # Guardamos el cargo en la sesión

                    flash(f"Bienvenido, {usuario}!", 'success')

                    # Redirigir según el cargo
                    if cargo == "Admin":
                        return redirect(url_for('dashboard'))
                    elif cargo == "Seguridad":
                        return redirect(url_for('panel_seguridad'))
                    elif cargo == "Recursos Humanos":
                        return redirect(url_for('rh'))
                    else:
                        flash("Cargo no reconocido.", 'danger')
                        return redirect(url_for('index'))
                else:
                    flash("Contraseña incorrecta. Inténtalo de nuevo.", 'danger')
            else:
                flash("Usuario no encontrado. Inténtalo de nuevo.", 'danger')
        else:
            flash("Por favor, completa todos los campos.", 'warning')
        
    return render_template('index.html')


@app.route('/dashboard')
def dashboard():
    if 'usuario' not in session:
        return redirect(url_for('login'))
    
    # Código para mostrar el Dashboard
    return render_template('dashboard.html')

@app.route('/panel_seguridad')
def panel_seguridad():
    if 'usuario' not in session:
        return redirect(url_for('login'))
    
    # Código para mostrar el Panel de Seguridad
    return render_template('panel_seguridad.html')

@app.route('/rh')  # Corregir nombre de la ruta
def rh():
    if 'usuario' not in session:
        return redirect(url_for('login'))
    
    # Código para mostrar el Panel de Recursos Humanos
    return render_template('rh.html')

@app.route('/logout')
def logout():
    session.pop('usuario', None)
    session.pop('cargo', None)
    flash("Has cerrado sesión.", 'info')
    return redirect(url_for('login'))

# Ruta para registrar usuarios (para propósitos de prueba, aquí se usa generate_password_hash)
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contrasena = request.form['contrasena']
        # Cifrar la contraseña antes de almacenarla en la base de datos
        contrasena_hash = generate_password_hash(contrasena)
        
        cursor.execute("INSERT INTO usuarios (Usuario, Contrasena, Cargo) VALUES (%s, %s, %s)", 
                       (usuario, contrasena_hash, "Recursos Humanos"))
        conn.commit()
        flash("Usuario registrado con éxito", 'success')
        return redirect(url_for('login'))
    
    return render_template('register.html')

if __name__ == '__main__':
    app.run(debug=True)
