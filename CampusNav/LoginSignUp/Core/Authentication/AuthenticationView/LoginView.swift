//
//  LoginView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // header + caption
                VStack(spacing: 26) {
                    Text("Login Here")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accentColor)
                    Text("Welcome back, we missed you!")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.vertical, 45)
                
                // form fields (email + password)
                VStack(spacing: 29) {
                    InputView(text: $email, placeholder: "Email")
                        .autocapitalization(.none)
                    InputView(text: $password, placeholder: "Password", isSecureField: true)
                    Text("Forgot your Password?")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.bottom, 31)
                
                // sign in button or ... create new account :)
                VStack(spacing: 30) {
                    Button {
                        Task {
                            try await vm.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(23)
                            .foregroundStyle(Color.white)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    }
                    // .disabled(formIsValid)
                    // .opacity(formIsValid ? 1.0 : 0.7)
                        
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Create new account")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                    }

                }
                Spacer()
            }
            .padding()
        }
    }
}

extension LoginView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView()
}
