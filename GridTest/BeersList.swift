//
//  BeerList.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import SwiftUI

struct BeersList: View {
    @ObservedObject var model:GridViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(model.beers) { beer in
                    BeerView(beer: beer)
                }
            }
        }
    }
}

struct BeersList_Previews: PreviewProvider {
    static var previews: some View {
        BeersList(model:GridViewModel())
    }
}
