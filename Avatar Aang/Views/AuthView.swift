//
//  AuthView.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 15.10.2023.
//

import SwiftUI

struct AuthView: View {
    @StateObject var vm = AuthViewModel()
    
    var body: some View {
        if vm.authenticated {
            CharactersListView(vm: vm)
        } else {
            NavigationView{
                    ScrollView{
                        VStack(alignment: .leading, spacing: 20) {
                            ZStack{
                                Circle()
                                    .foregroundColor(.white)
                                Image("avatarlogo")
                                    .resizable()
                                    .scaledToFit()
                            }
//                            Spacer()
                            Text("Log in")
                                //.foregroundColor(.white)
                                .font(.system(size: 50, weight: .medium, design: .rounded))
                            TextField("Username", text: $vm.username)
                                .textFieldStyle(.roundedBorder)
                                .textInputAutocapitalization(.never)
                            SecureField("Password", text: $vm.password)
                                .textFieldStyle(.roundedBorder)
                                .textInputAutocapitalization(.never)
                                .privacySensitive()
                            HStack{
                                Spacer()
                                Button("Forgot password?", action: vm.logPressed)
                                    .tint(.red.opacity(1))
                                    .buttonStyle(.bordered)
                                Spacer()
                                Button("Log in", action: vm.authenticate)
                                    
                                    .buttonStyle(.bordered)
                                Spacer()
                            }
                            Spacer()
                        }
                        .alert("Access denied", isPresented: $vm.invalid) {
                            Button("Dismiss", action: vm.logPressed)
                        }
                        .frame(width: 300)
                        .padding()
                    }
                    .transition(.offset(x: 0, y: 850))
                }.onTapGesture{
                    UIApplication.shared.endEditing()
                }
        }
    }
}

#Preview {
    AuthView()
}
