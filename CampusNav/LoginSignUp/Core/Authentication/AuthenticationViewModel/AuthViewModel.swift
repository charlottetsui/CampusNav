//
//  AuthViewModel.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import MapKit

protocol AuthFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var allRoutes: [[MKPolyline]] = []
    @Published var selectedCourses: [Course] = []
    @Published var allCourses: [NewCourse] = []
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do  {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: FAILED TO LOG IN ERROR \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password) // try to create user using Firebase code which we get from the Firebase package manager and then await the result and store it in this property
            self.userSession = result.user // if we get a successful result, we set our userSession property :D
            let user = User(id: result.user.uid, fullname: fullname, email: email) // create our user object
            let encodedUser = try Firestore.Encoder().encode(user) // encode the object
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) // upload the object to Firestore
            await fetchUser() // once we create our user -> set userSession -> fetch data so we can properly display on screen
        } catch { // catch any errors and print out the error description :(
            print("DEBUG: FAILED TO CREATE USER ERROR \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on Firebase
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: FAIL TO SIGN OUT WITH ERROR \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: CURRENT USER IS \(self.currentUser)")
    }
    
    func saveRoute(route: [MKPolyline]) {
        let newCourse = NewCourse(routePoints: route, course: selectedCourses)
        allRoutes.append(newCourse.routePoints)
        allCourses.append(newCourse)
        selectedCourses = []
    }
    
    func addCourse(course: Course) {
        selectedCourses.append(course)
    }
}
