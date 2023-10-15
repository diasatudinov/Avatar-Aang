//
//  ContentView.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 14.10.2023.
//

import SwiftUI
import CachedAsyncImage

struct CharactersListView: View {
    @StateObject private var viewModel = CharactersListViewModel()
    @State var vm: AuthViewModel

    let nilUrl = "https://vignette.wikia.nocookie.net/avatar/images/f/f8/Chong.png/revision/latest?cb=20140127210142"
    let nilAffiliation = "Not indicated"
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.characters, id: \.self) { character in
                    NavigationLink{
                        FullInfoView(name: character.name, affiliation: character.affiliation ?? nilAffiliation, photoURL: character.photoURL ?? nilUrl)
                    } label: {
                        CharacterInfoCellView(name: character.name, affiliation: character.affiliation ?? nilAffiliation, imageUrl: character.photoURL ?? nilUrl)
                    }
                    
                        
                }
                .listRowSeparator(.hidden)
                


            }
            .listStyle(.grouped)
            .onAppear(perform: viewModel.fetchData)
            .navigationTitle("Characters")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log out", action: vm.logOut)
                        .tint(.red)
                        .buttonStyle(.bordered)
                }
            }
        }
    }
}

#Preview {
    CharactersListView(vm: AuthViewModel())
}
