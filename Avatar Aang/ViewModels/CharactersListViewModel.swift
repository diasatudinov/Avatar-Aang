//
//  CharactersListViewModel.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 14.10.2023.
//

import Combine
import SwiftUI

class CharactersListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetchData() {
        
        guard let url = URL(string: "https://last-airbender-api.fly.dev/api/v1/characters?perPage=<50>") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do{
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    self?.characters = characters
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    
}

