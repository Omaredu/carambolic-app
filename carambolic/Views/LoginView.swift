//
//  LoginView.swift
//  carambolic
//
//  Created by Omar Sánchez on 27/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 100, height: 100)
                        .blur(radius: 60)

                    Circle()
                        .fill(.yellow)
                        .frame(width: 100, height: 100)
                        .blur(radius: 60)
                    Circle()
                        .fill(.orange)
                        .frame(width: 100, height: 100)
                        .blur(radius: 60)
                }
                .scaleEffect(2)
                .offset(y: -50)
            }
            
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Spacer()
                Text("Your bookmarks on steroids")
                    .bold()
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .multilineTextAlignment(.leading)
                Spacer()
                TextField("Email", text: $username)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10)
                Button(action: {
                    // Aquí la lógica de inicio de sesión
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
