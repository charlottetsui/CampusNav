//
//  User.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return "N/A"
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "MOCK USER", email: "MOCKEMAIL@gmail.com")
}
