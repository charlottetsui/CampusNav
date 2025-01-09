//
//  LoginView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // header + caption
                VStack(spacing: 26) {
                    Text("Create Account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accentColor)
                    Text("Create an account so you can get started!")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.vertical, 45)
                
                // form fields (email + password)
                VStack(spacing: 29) {
                    InputView(text: $email, placeholder: "Email")
                        .autocapitalization(.none)
                    InputView(text: $fullname, placeholder: "Full Name")
                    InputView(text: $password, placeholder: "Password", isSecureField: true)
                    InputView(text: $confirmPassword, placeholder: "Confirm Password", isSecureField: true)
                }
                .padding(.bottom, 31)
                
                // sign up button or ... already have an account :)
                VStack(spacing: 30) {
                    Button {
                        Task {
                            try await vm.createUser(withEmail: email, password: password, fullname: fullname)
                        }
                    } label: {
                        Text("Sign Up")
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
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Already have an account")
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

extension SignUpView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5 && !fullname.isEmpty && password == confirmPassword
    }
}

#Preview {
    SignUpView()
}
