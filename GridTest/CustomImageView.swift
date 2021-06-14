//
//  CustomImageView.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/06/21.
//

import SwiftUI

import SwiftUI

struct CustomImageView: View {
    var url: URL?
    
    var body: some View {
        if let url = url {
            if #available(iOS 15.0, *) {
                AsyncImage(url: url) { phase in
                    viewForPhase(phase)
                }
            }
            else {
                ImageView(withURL: url.absoluteString)
            }
        }
        else {
            ImageView.empty
        }
    }
    
    @available(iOS 15.0, *)
    @ViewBuilder
    private func viewForPhase(_ phase:AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        case .failure(let error):
            let _ = print("error \(error)")
            ImageView.empty
        @unknown default:
            let _ = print("unknown phase \(phase)")
            ImageView.empty
        }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView()
    }
}
