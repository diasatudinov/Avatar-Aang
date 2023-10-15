//
//  FullInfoView.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 15.10.2023.
//

import SwiftUI
import CachedAsyncImage

struct FullInfoView: View {
    var name: String
    var affiliation: String
    var photoURL: String
    var body: some View {
        VStack(spacing: 30){
            Spacer()
            CachedAsyncImage(url: URL(string: photoURL)) { image in
                image
                    .resizable()
                    .frame(width: 400, height: 250)
                    .scaledToFit()
                    .cornerRadius(10)
            } placeholder: {
                ZStack{
                    Rectangle()
                        .frame(width: 400, height: 250)
                        .foregroundColor(.secondary)
                        .cornerRadius(10)
                    ProgressView()
                }
                
            }
            
            Text("Character name :")
            Text(name)
                .font(.system(size: 45))
                .multilineTextAlignment(.center)
            Text("Character affiliation :")
            Text(affiliation)
                .font(.system(size: 45))
                .multilineTextAlignment(.center)
            Spacer()
        }.navigationTitle(name).navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FullInfoView(name: "Aang", affiliation: "Water", photoURL: "https://vignette.wikia.nocookie.net/avatar/images/f/f8/Chong.png/revision/latest?cb=20140127210142")
}
