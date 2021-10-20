//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Stephen Learmonth on 15/10/2021.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                guard let safeData = data else { return }
                do {
                    let results = try decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
