//
//  Page1TableDataSource.swift
//  LadoTsivtsivadze_55
//
//  Created by lado tsivtsivadze on 7/16/21.
//

import UIKit
//
class Page1TableDataSource: GenericTableDataSource<[BookModel], Page1Controller, BookModel.Type> {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellsArr.first
        let realCell = tableView.dequeueReusableCell(withIdentifier: (cell?.identifier)!) as? Page1Cell
        guard let data = data else { return realCell! }
        realCell!.bookModel = data[indexPath.row]
        return realCell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.bounds.width
        return width / 1.6
    }
}
