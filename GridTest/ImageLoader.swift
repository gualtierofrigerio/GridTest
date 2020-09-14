//
//  ImageLoader.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import Combine
import Foundation

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString:String) {
        self.urlString = urlString
        loadImage(atUrl: urlString)
    }
    
    func loadImage(atUrl urlString:String) {
        guard let url = URL(string: urlString) else { return }
        if let cachedData = ImageLoaderCache.getData(forUrl: urlString) {
            DispatchQueue.main.async {
                self.data = cachedData
            }
        }
        else {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.data = data
                    ImageLoaderCache.setData(data, forUrl: urlString)
                }
            }
            task.resume()
        }
    }
    
    func realoadData() {
        loadImage(atUrl: urlString)
    }
    
    private var urlString:String
}

class ImageLoaderCache {
    static var cache:[String:Data] = [:]
    
    static func getData(forUrl url:String) -> Data? {
        cache[url]
    }
    
    static func setData(_ data:Data, forUrl url:String) {
        cache[url] = data
    }
}
