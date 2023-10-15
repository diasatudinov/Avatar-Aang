//
//  CharacterInfoCellView.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 14.10.2023.
//

import SwiftUI
import CachedAsyncImage

struct CharacterInfoCellView: View {
    @State private var isBouncing = false
    var name: String
    var affiliation: String
    var imageUrl: String
    var body: some View {
        ZStack(alignment: .leading){
            Color(.secondarySystemBackground)
            HStack{
                VStack{
                    CachedAsyncImage(url: URL(string: imageUrl )) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 100)
                            .scaledToFit()
                            .cornerRadius(15)
                            .padding(.horizontal,16)
                            .scaleEffect(isBouncing ? 1.0 : 0.7)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.0)) {
                                    isBouncing = true
                                }
                            }
                    } placeholder: {
                        ZStack{
                            Rectangle()
                                .frame(width: 150 * 0.7, height: 100 * 0.7)
                                .foregroundColor(.secondary)
                                .cornerRadius(15)
                                .padding(.horizontal,16)
                            ProgressView()
                        }
                    }
                }
                VStack(alignment: .leading){
                    Text(name)
                        .font(Font.custom("SF Pro Display", size: 25)
                            .weight(.bold))
                        .italic()
                    Text("Nation: \(affiliation)")
                        .font(.system(size: 15, weight: .semibold))
                    
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
        }
        .cornerRadius(12)
    }
}

#Preview {
    CharacterInfoCellView(name: "Aang", affiliation: "Water", imageUrl: "https://vignette.wikia.nocookie.net/avatar/images/f/f8/Chong.png/revision/latest?cb=20140127210142")
}
