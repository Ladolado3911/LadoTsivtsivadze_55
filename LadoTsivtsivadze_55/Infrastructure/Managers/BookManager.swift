//
//  BookManager.swift
//  LadoTsivtsivadze_55
//
//  Created by lado tsivtsivadze on 7/16/21.
//

import UIKit

class BookManager {
    
    private var networkManager: NetworkManager = NetworkManager()
        
    func getBooks(completion: @escaping ([BookModel]) -> Void) {
        networkManager.get(model: [Book].self, with: Endpoints.booksEndpoint) { result in
            switch result {
            case .success(let books):
                let newBooks = books.map { BookModel(with: $0) }
                completion(newBooks)
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    func getAuthorImage(byName name: String, completion: @escaping (URL) -> Void) {
        networkManager.get(model: [Author].self, with: Endpoints.authorsEndpoint) { result in
            switch result {
            case .success(let authors):
                let filteredAuthor = authors.filter { $0.name == name }
                let convertedAuthor = AuthorModel(with: filteredAuthor.first!)
                completion(convertedAuthor.image)
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
            }
        }
    }
}
