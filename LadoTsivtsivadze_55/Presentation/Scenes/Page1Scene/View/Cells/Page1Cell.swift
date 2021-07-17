//
//  Page1Cell.swift
//  LadoTsivtsivadze_55
//
//  Created by lado tsivtsivadze on 7/17/21.
//

import UIKit
import Kingfisher

class Page1Cell: UITableViewCell {
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var bookModel: BookModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        designView()
        configureInfo()
        
        
    }
    
    func configureInfo() {
        guard let bookModel = bookModel else { return }
        //imgView.kf.setImage(with: bookModel.image)
        let imgData = try? Data(contentsOf: bookModel.image)
        guard let imgData = imgData else { return }
        let image = UIImage(data: imgData)
        imgView.image = image
        titleLabel.text = bookModel.title
    }
    
    func designView() {
        subView.layer.masksToBounds = false
        subView.layer.shadowOffset = CGSize(width: 0, height: 3)
        subView.layer.shadowRadius = 3
        subView.layer.shadowOpacity = 0.3
        subView.layer.shadowPath = UIBezierPath(roundedRect: subView.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        subView.layer.shouldRasterize = true
        subView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func designImgView() {
    
    }
    
}
