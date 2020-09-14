//
//  ContentView.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 11/09/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GridView(model:GridViewModel())
        //BeersList(model: GridViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
