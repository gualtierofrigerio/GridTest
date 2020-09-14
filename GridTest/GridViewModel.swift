//
//  GridViewModel.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import Foundation
import Combine

class GridViewModel:ObservableObject {
    @Published var beers:[Beer] = []
    
    init() {
        restClient = SimpleRESTClient()
        let baseUrl = "https://api.punkapi.com/v2/"
        dataSource = DataSource(baseURLString: baseUrl, restClient: restClient)
        
        dataSource.getBeers(page: 1, completion: { [weak self] beers in
            if let beers = beers {
                DispatchQueue.main.async {
                    self?.beers = beers
                    print("model updated beers count = \(beers.count)")
                }
            }
        })
    }
    
    // MARK: - Private
    
    private var dataSource:DataSource
    private var restClient:RESTClient
}
