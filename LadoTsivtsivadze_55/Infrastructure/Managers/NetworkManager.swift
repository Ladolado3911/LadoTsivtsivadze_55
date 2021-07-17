//
//  NetworkManager.swift
//  LadoTsivtsivadze_51
//
//  Created by lado tsivtsivadze on 7/12/21.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func get<T: Codable>(with url: String, completion: @escaping ((Result<T, Error>) -> Void))
}

final class NetworkManager: NetworkManagerProtocol {
    func get<T: Codable>(with url: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: URL(string: url)!) {data, response, error in
            do {
                let items = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(items))
            }
            catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

