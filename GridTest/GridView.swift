//
//  GridView.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import SwiftUI

struct GridView: View {
    var columns3Fixed: [GridItem] = [
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10)
    ]
    
    var columns3Flexible: [GridItem] = [
        GridItem(.flexible(minimum: 50, maximum: 150), spacing: 10),
        GridItem(.fixed(140), spacing: 10),
        GridItem(.fixed(140), spacing: 10)
    ]
    
    var column3Adaptive: [GridItem] = [
        GridItem(.adaptive(minimum: 90, maximum: 110), spacing: 10),
        GridItem(.fixed(150), spacing: 10)
    ]
    
    var column4Adaptive: [GridItem] = [
        GridItem(.adaptive(minimum: 80, maximum: 150), spacing: 10)
    ]
    
    var rows: [GridItem] = [
        GridItem(.adaptive(minimum: 200, maximum: 250), spacing: 10),
        GridItem(.fixed(100), spacing: 10)
    ]
    
    @ObservedObject var model:GridViewModel
    
    var body: some View {
// uncomment to use colums layout
//        ScrollView {
//            LazyVGrid(
//                columns: column4Adaptive,
//                alignment: .center,
//                spacing: 10,
//                pinnedViews: []
//            ) {
//                ForEach(model.beers) { beer in
//                    BeerView(beer: beer)
//                }
//            }
//        }
        
// uncomment to use rows layout
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 50, pinnedViews:[]
            ) {
                ForEach(model.beers) { beer in
                    BeerView(beer: beer).border(Color.black)
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
