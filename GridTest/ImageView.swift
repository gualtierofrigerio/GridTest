//
//  ImageView.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import Combine
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    @State var imageIsEmpty = true
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
        }.onReceive(imageLoader.didChange) { data in
            if let image = UIImage(data: data) {
                self.image = image
            }
            else {
                self.imageIsEmpty = true
                self.image = UIImage()
            }
        }
        .onAppear {
            if imageIsEmpty {
                self.imageLoader.realoadData()
            }
        }
    }
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
        self.urlString = url
    }
    
    func updateImage() {
        imageLoader.loadImage(atUrl: urlString)
    }
    
    private var urlString:String = ""
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
