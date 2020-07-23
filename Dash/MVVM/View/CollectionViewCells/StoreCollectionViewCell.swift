//
//  StoreCollectionViewCell.swift
//  Dash
//
//  Created by Omeesh Sharma on 23/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeCategories: UILabel!
    @IBOutlet weak var storeOfferView: UIView!
    @IBOutlet weak var storeOffer: UILabel!
    @IBOutlet weak var storeDetailsView: UIStackView!
    @IBOutlet weak var storeRating: UILabel!
    @IBOutlet weak var storeTime: UILabel!
    @IBOutlet weak var storeKValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: SETUP CELL
    func setupCell(model: StoreModel, type: String?){
        self.storeImage.sd_setImage(with: URL(string: model.image?.getImageURL() ?? ""), placeholderImage: nil, options: [], completed: nil)
        self.storeName.text = model.name ?? ""
        self.storeRating.text = "\(model.ratings ?? 0) (\(model.ratingCount ?? 0))"
        self.storeTime.text = "\(model.avgDeliveryTime ?? 0) Min"
        self.storeKValue.text = "\(model.avgOrderPrice ?? 0)"
        self.storeCategories.text = model.categories?.map({$0.name ?? ""}).joined(separator: ",")
        
        if type?.lowercased().contains("offer") == true{
            //Show Offer and Hide Categories for Offer Section
            self.storeOfferView.isHidden = false
            self.storeOffer.text = "\(model.discount ?? 0)% Off Valid Up to KES \(model.discountUpto ?? 0)"
            self.storeCategories.isHidden = true
        } else{
            //Hide offers and show Categories for other Sections
            self.storeOfferView.isHidden = true
            self.storeCategories.isHidden = false
            
        }
        
    }
    
}
