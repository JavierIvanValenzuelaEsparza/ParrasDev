import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State private var nombre: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    @State private var isLoading: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Registro en Parras Dev")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 40)
            
            Spacer()
            
            TextField("Nombre", text: $nombre)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 40)
            
            TextField("Nickname (Email)", text: $nickname)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 40)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 40)
            
            SecureField("Confirmar Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 40)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            if isLoading {
                ProgressView()
                    .padding()
            }
            
            Button(action: registerUser) {
                Text("Registrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
            }
            .disabled(isLoading)
            
            Spacer()
        }
        .padding()
    }
    
    func registerUser() {
        // Validaciones previas al registro
        guard !nombre.isEmpty else {
            errorMessage = "Por favor, ingresa tu nombre."
            return
        }
        guard !nickname.isEmpty, nickname.contains("@"), nickname.contains(".") else {
            errorMessage = "Por favor, ingresa un correo electrónico válido."
            return
        }
        guard !password.isEmpty else {
            errorMessage = "Por favor, ingresa una contraseña."
            return
        }
        guard password == confirmPassword else {
            errorMessage = "Las contraseñas no coinciden."
            return
        }
        
        // Mostrar indicador de carga
        isLoading = true
        errorMessage = nil
        
        Auth.auth().createUser(withEmail: nickname, password: password) { authResult, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    print("Error registering user: \(error.localizedDescription)")
                    self.errorMessage = handleError(error) // Llama a la función de manejo de errores
                } else {
                    self.errorMessage = "¡Registro exitoso!"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.dismiss() // Cierra la vista de registro y regresa a LoginView
                    }
                }
            }
        }
    }
    
    func handleError(_ error: Error) -> String {
        let nsError = error as NSError
        switch nsError.code {
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            return "El correo electrónico ya está en uso."
        case AuthErrorCode.weakPassword.rawValue:
            return "La contraseña es demasiado débil. Intente con una contraseña más fuerte."
        case AuthErrorCode.invalidEmail.rawValue:
            return "El correo electrónico no es válido. Intente con otro."
        default:
            return nsError.localizedDescription
        }
    }
}
