//
//  StoresViewModel.swift
//  Dash
//
//  Created by Omeesh Sharma on 23/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit
import Alamofire

class StoresViewModel {
    
    //MARK: VARIABLES
    var categories = [CategoryModel]()
    var storesSections = [[StoreModel]]()
    
    var sectionNames = [String]()
    var sectionOrder = ["categories","saved","bestOffers","recommended"]
    
    //MARK: API Request
    
    func getDetails(result: @escaping()->Void){
        let params: Parameters = [
            "latitude": latitude,
            "longitude": longitude
        ]
        ApiInterface.shared.ApiRequest(strURL: (baseURL + detailsApi), params: params) { (json) in
            //Check for Error from Api response
            guard json["response"]["success"].boolValue else{
                result()
                return
            }
            
            //Success
            var keys = json["data"].filter({$0.0 != "notiCount"}).map({$0.0})
            keys = self.reOrder(array: keys, defaultOrder: self.sectionOrder)
            
            for key in keys{
                self.sectionNames.append(self.getSectionName(type: key))
                if let data = json["data"][key].array{
                    if key == "categories"{
                        //Save Categories
                        self.categories = data.map({CategoryModel.init(json: $0)})
                    } else{
                        //Save Stores
                        self.storesSections.append(data.map({StoreModel.init(json: $0)}))
                    }
                }
            }
            
            result()
        }
    }
    
    ///Get Section Names according to data type
    func getSectionName(type: String)-> String{
        switch type.lowercased() {
        case "categories":
            return "Category"
        case "saved":
            return "Saved restaturants"
        case "bestoffers":
            return "Best Offers"
        case "recommended":
            return "Recommended"
        default:
            return type.capitalized
        }
    }
    
    ///Sort the sections in particular order
    func reOrder(array : [String] , defaultOrder : [String]) -> [String]{
        return array.sorted { (a, b) -> Bool in
            if let first = defaultOrder.firstIndex(of: a), let second = defaultOrder.firstIndex(of: b) {
                return first < second
            }
            return false
        }
    }

}
