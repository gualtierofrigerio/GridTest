//
//  RESTClient.swift
//  GridTest
//
//  Created by Gualtiero Frigerio on 14/09/2020.
//

import Foundation

protocol RESTClient {
    func getData(atURL url: URL, completion: @escaping (Data?) -> Void)
}

class SimpleRESTClient: RESTClient {
    func getData(atURL url: URL, completion: @escaping (Data?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            completion(data)
        }
        task.resume()
    }
}
