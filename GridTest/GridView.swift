//
//  GridView.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import SwiftUI

struct GridView: View {
    var columns: [GridItem] = [
        //GridItem(.flexible(minimum: 80, maximum: 100) , spacing: 10),
        //GridItem(.fixed(50), spacing: 10),
        GridItem(.adaptive(minimum: 90, maximum: 140), spacing: 10)
        
    ]
    
    @ObservedObject var model:GridViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 10,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                ForEach(model.beers) { beer in
                    BeerView(beer: beer)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(model:GridViewModel())
    }
}
