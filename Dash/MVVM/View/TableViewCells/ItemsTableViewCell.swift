//
//  ItemsTableViewCell.swift
//  Dash
//
//  Created by Omeesh Sharma on 23/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: VARIABLES

    var modelCategories = [CategoryModel]()
    var modelStores = [StoreModel]()
    var isCategory = false
    var sectionType : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    //MARK: SETUP CELL
    
    ///Setup Category type Cell
    func setupCategoryCell(models: [CategoryModel]){
        self.isCategory = true
        self.modelCategories = models
        self.collectionView.reloadData()
    }
    
    ///Setup Store type Cell
    func setupStoresCell(models: [StoreModel], type: String){
        self.isCategory = false
        self.sectionType = type
        self.modelStores = models
        self.collectionView.reloadData()
    }

}

extension ItemsTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard !self.isCategory else{
            return self.modelCategories.count
        }
        return self.modelStores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard !self.isCategory else{
            //Category type Cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)as! CategoryCollectionViewCell
                cell.setupCell(model: self.modelCategories[indexPath.row])
            return cell
        }
        
        //Store type Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath)as! StoreCollectionViewCell
        cell.setupCell(model: self.modelStores[indexPath.row], type:  self.sectionType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //Left and right ends Spacings
        return .init(top: 0, left: 25, bottom: 0, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //Spacing between cells
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard !self.isCategory else{
            //Category type Cell ( 2 and half cell Visible)
            let width = (collectionView.frame.width /  2.5) - 25
            return .init(width: width, height: collectionView.frame.height)
        }
        
        //Store type Cell (1 and half cell Visible)
        let width = (collectionView.frame.width /  1.5) - 25
        return .init(width: width, height: collectionView.frame.height)
    }
    
}
