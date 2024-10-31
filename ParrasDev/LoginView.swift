import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Parras Dev")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 40)

                Spacer()

                TextField("Nickname (Email)", text: $nickname)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 40)

                SecureField("Password", text: $password)
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

                Button(action: loginUser) {
                    Text("Iniciar Sesión")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 40)
                }

                NavigationLink("¿No tienes cuenta? Regístrate aquí", destination: RegisterView())
                    .foregroundColor(.blue)
                    .padding(.top, 10)

                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $isLoggedIn) {
                MainView() // Show main view when logged in
            }
        }
    }

    func loginUser() {
        Auth.auth().signIn(withEmail: nickname, password: password) { authResult, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
            } else {
                self.errorMessage = nil
                self.isLoggedIn = true
            }
        }
    }
}
