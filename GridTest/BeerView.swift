//
//  BeerView.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import SwiftUI

struct BeerView: View {
    var beer:Beer
    
    var body: some View {
        VStack {
            Text(beer.name).font(Font.caption)
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: beer.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure(let error):
                        let _ = print("error \(error)")
                        Text("error...")
                    @unknown default:
                        let _ = print("unknown phase \(phase)")
                        Text("unknown")
                    }
                }
                .frame(width:100, height:100)
            } else {
                ImageView(withURL: beer.imageUrl)
            }
        }
    }
}

let testBeer = Beer(id: 0, abv: 0, brewersTips: "tips", contributedBy: "contributedBy", description: "test description", imageUrl: "", name: "test name", tagline: "tag line")

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(beer: testBeer)
            .padding()
            
    }
}
