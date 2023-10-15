//
//  AuthViewModel.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 15.10.2023.
//

import SwiftUI

class AuthViewModel: ObservableObject{
    @AppStorage("AUTH_KEY") var authenticated = false {
        willSet{ objectWillChange.send()}
    }
    @AppStorage("USER_KEY") var username = ""
    @Published var password = ""
    @Published var invalid: Bool = false
    
    private var sampleUser = "123456"
    private var samplePassword = "123456"
    
    init() {
        print("Currently logged on: \(authenticated)")
        print("Current user: \(username)")
    }
    
    func toggleAuthentication() {
        self.password = ""
        withAnimation{
            authenticated.toggle()
        }
    }
    
    func authenticate() {
        guard self.username.lowercased() == sampleUser else {
            self.invalid = true
            return
        }
        
        guard self.password.lowercased() == samplePassword else {
            self.invalid = true
            return
        }
        
        toggleAuthentication()
        
    }
    
    func logOut(){
        toggleAuthentication()
    }
    
    func logPressed(){
        print("Button pressed.")
    }
}

