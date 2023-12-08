//
//  NetworkManager.swift
//  DoctorApp
//
//  Created by Asya Checkanar on 08.12.2023.
//

import Foundation
import UIKit

class NetworkManager: NSObject {
    static let shared = NetworkManager()
    private let baseURL = "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4"
    private override init() {}
    
    func getDoctors(completion: @escaping (Result <[Doctor], TaskError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.incorrectUrlError))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.urlDidNotLoadError))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.corruptedResponseError))
                return
            }
            guard let data = data else {
                completion(.failure(.dataNotReceivedError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(FirstResponse.self, from: data)
                completion(.success(decodedResponse.record.data.users))
            } catch(let catchError) {
                print(catchError)
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }
        task.resume()
    }
}
