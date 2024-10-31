import SwiftUI
import FirebaseAuth

struct MainView: View {
    @Environment(\.dismiss) var dismiss // Para cerrar la vista después del cierre de sesión
    @State private var isLoggedOut = false // Para manejar el estado de cierre de sesión

    var body: some View {
        if isLoggedOut {
            // Redirige a la vista de inicio de sesión
            LoginView() // Asegúrate de tener una vista de LoginView implementada
        } else {
            VStack {
                Text("Bienvenido a Parras Dev")
                    .font(.largeTitle)
                    .padding()

                Button(action: logoutUser) {
                    Text("Cerrar Sesión")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }

    func logoutUser() {
        do {
            try Auth.auth().signOut()
            isLoggedOut = true // Actualiza el estado para redirigir a la vista de inicio de sesión
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
}
