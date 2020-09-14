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
            ImageView(withURL: beer.imageUrl)
        }
    }
}

let testBeer = Beer(id: 0, abv: 0, brewersTips: "tips", contributedBy: "contributedBy", description: "test description", imageUrl: "", name: "test name", tagline: "tag line")

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(beer: testBeer)
    }
}
