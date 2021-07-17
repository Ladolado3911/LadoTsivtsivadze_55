//
//  Page1Controller.swift
//  LadoTsivtsivadze_55
//
//  Created by lado tsivtsivadze on 7/16/21.
//

import UIKit

class Page1Controller: BaseViewController {
    
    private var dataSource: Page1TableDataSource?
    private var data: [BookModel] = []
    private var bookManager: BookManager = BookManager()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        bookManager.getBooks { [weak self] books in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.configDataSource(with: books)
            }
        }
    }
    
    func configDataSource(with data: [BookModel]) {
        let cell = Cell(nibName: "Page1Cell", identifier: "Page1Cell")
        dataSource = Page1TableDataSource(tableView: tblView,
                                          cellsArray: [cell],
                                          rootController: self,
                                          dataArray: data,
                                          dataElement: BookModel.self)
    }
}
