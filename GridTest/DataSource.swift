//
//  DataSource.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import UIKit

struct Beer: Codable, Hashable, Identifiable {
    var id:Int
    var abv:Float
    var brewersTips:String
    var contributedBy:String
    var description:String
    var imageUrl:String
    var name:String
    var tagline:String
    
    static func == (lhs:Beer, rhs:Beer) -> Bool {
        return lhs.id == rhs.id
    }
}

class DataSource {
    
    var baseURLString:String
    var restClient:RESTClient

    private var categories:[String] = []
    
    init(baseURLString:String, restClient:RESTClient) {
        self.baseURLString = baseURLString
        self.restClient = restClient
    }
    
    func getBeers(page:Int, completion: @escaping ([Beer]?) -> Void) {
        guard let url = urlForPage(page) else {
            completion(nil)
            return
        }
        restClient.getData(atURL: url) { data in
            guard let data = data,
                  let beers = self.getBeersFromData(data) else {
                    completion(nil)
                    return
            }
            completion(beers)
        }
    }
    
    func getBeers(withFilter filter:String, completion: @escaping ([Beer]?) -> Void) {
        getBeers(page: 1) { beers in
            var filteredBeers = beers ?? []
            if filter.count > 0 {
                filteredBeers = filteredBeers.filter({$0.name.lowercased().contains(filter.lowercased())})
            }
            completion(filteredBeers)
        }
    }
    
    // MARK: - Private
    
    private func getBeersFromData(_ data:Data) -> [Beer]? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var beers:[Beer]?
        do {
            beers = try decoder.decode([Beer].self, from: data)
        }
        catch {
            print("decodeData: cannot decode object err \(error)")
        }
        return beers
    }
    
    private func urlForPage(_ page:Int) -> URL? {
        let urlString = baseURLString + "beers?page=\(page)"
        return URL(string: urlString)
    }
}

