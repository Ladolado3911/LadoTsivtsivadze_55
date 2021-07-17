//
//  Models.swift
//  LadoTsivtsivadze_55
//
//  Created by lado tsivtsivadze on 7/16/21.
//

import UIKit

struct Book: Codable {
    var title: String?
    var image: String?
    var author: String?
}

struct Author: Codable {
    var name: String?
    var image: String?
}


struct BookModel {
    
    private var book: Book!
    
    var title: String {
        return book.title ?? ""
    }
    
    var image: URL {
        let url = URL(string: book.image ?? "")!
        return url
    }
    
    var author: String {
        return book.author ?? ""
    }
    
    init(with book: Book) {
        self.book = book
    }
}

struct AuthorModel {
    
    private var author: Author!
    
    var name: String {
        return author.name ?? ""
    }
    
    var image: URL {
        let url = URL(string: author.image ?? "")!
        return url
    }
    
    init(with author: Author) {
        self.author = author
    }
}
