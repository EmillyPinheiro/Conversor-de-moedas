//
//  Tela inicial.swift
//  Better Sleep
//
//  Created by user on 23/10/24.
//

import SwiftUI

struct Tela_inicial: View {
    @State private var image: UIImage?
    
    var body: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
            
            Text("Better Sleep")
                .bold()
                .font(.system(size: 35))
                .foregroundColor(.white)
                .position(x: UIScreen.main.bounds.width / 2.2, y: 82)
            
            Text("Olá! Seja bem-vindo(a)! \nAqui você irá praticar o ritual do sono, tendo como consequência \nmelhores resultados e melhor eficácia na duração e na qualidade do seu sono.")
                .bold()
                .font(.system(size: 15))
                .foregroundColor(.white)
                .position(x: UIScreen.main.bounds.width / 1.5, y: 150)
                .multilineTextAlignment(.center)
                .padding(
            )
            
        }
        .onAppear {
            loadImage(from: "https://wallpapers.com/images/hd/starry-night-and-dark-blue-sky-nkybmoo3e3te9v63.webp")
        }
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

#Preview {
    Tela_inicial()
}