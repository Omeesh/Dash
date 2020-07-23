//
//  CategoryCollectionViewCell.swift
//  Dash
//
//  Created by Omeesh Sharma on 23/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: SETUP CELL
    func setupCell(model: CategoryModel){
        self.categoryImage.sd_setImage(with: URL(string: model.image?.getImageURL() ?? ""), placeholderImage: nil, options: [], completed: nil)
        self.categoryName.text = model.name ?? ""
    }
}
