//
//  InputView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        if isSecureField { // if we are making a password textfield -> use SecureField
            SecureField(placeholder, text: $text)
                .fontWeight(.bold)
                .padding(20)
                .background(Color.accentColor.opacity(0.3))
                .cornerRadius(15)
        } else {
            TextField(placeholder, text: $text)
                .fontWeight(.bold)
                .padding(20)
                .background(Color.accentColor.opacity(0.3))
                .cornerRadius(15)
        }
    }
}

#Preview {
    InputView(text: .constant(""), placeholder: "Email")
}
