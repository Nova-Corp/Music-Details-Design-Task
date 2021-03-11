//
//  APIManager.swift
//  Music-Details-Design-Task
//
//  Created by ADMIN on 11/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}

    func fetchData(url: String, header: [String: String]?, method: String?, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: url) else {
            print("URL Not Valid.")
            return
        }
        var urlRequest = URLRequest(url: url)

        if let method = method {
            urlRequest.httpMethod = method
        }

        if let header = header {
            for param in header {
                urlRequest.addValue(param.value, forHTTPHeaderField: param.key)
            }
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let data = data {
                completion(data, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
