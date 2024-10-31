# ParrasDev

## Descripción
ParrasDev es un proyecto de aplicación que utiliza SwiftUI y Firebase para ofrecer funcionalidades de registro y autenticación de usuarios. La aplicación permite a los usuarios registrarse con su nombre, correo electrónico y contraseña, y también proporciona una vista principal donde los usuarios pueden cerrar sesión.

## Funcionalidades
- **Registro de Usuario**: Permite a los usuarios registrarse con su nombre, correo electrónico y contraseña.
- **Autenticación**: Utiliza Firebase Authentication para gestionar el inicio de sesión y el cierre de sesión.
- **Interfaz de Usuario**: Construida con SwiftUI, ofreciendo una experiencia de usuario fluida y moderna.

## Tecnologías Utilizadas
- **SwiftUI**: Para la interfaz de usuario.
- **Firebase**: Para la autenticación de usuarios.
- **Xcode**: Entorno de desarrollo utilizado para construir la aplicación.

## Estructura del Proyecto
ParrasDev/ │ ├── RegisterView.swift # Vista para el registro de usuario ├── MainView.swift # Vista principal de la aplicación ├── GoogleService-Info.plist # Configuración de Firebase ├── Otros Archivos... # Otros archivos y recursos del proyecto │ └── README.md # Este archivo


## Requisitos
- Xcode 13 o superior
- CocoaPods o Swift Package Manager para la gestión de dependencias de Firebase

## Instalación
1. Clona el repositorio:
   ```bash
   git clone https://github.com/JavierIvanValenzuelaEsparza/ParrasDev.git
   cd ParrasDev
2. Abre el proyecto en Xcode.

3. Asegúrate de tener el archivo GoogleService-Info.plist en el directorio del proyecto, ya que es necesario para la configuración de Firebase.

4. Instala las dependencias de Firebase (si es necesario).

5. Configura Firebase Authentication en el Firebase Console:

6. Habilita el método de autenticación por correo electrónico en Authentication
7. Ejecuta la aplicación en un simulador o dispositivo real.
   
