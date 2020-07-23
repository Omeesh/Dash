//
//  ApiInterface.swift
//  Dash
//
//  Created by Omeesh Sharma on 23/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiInterface: NSObject {
    
    static let shared = ApiInterface()
    
    func createHeaders()-> [String:String]{
        return ["Authorization": accessToken]
    }
    
    func ApiRequest(strURL: String, params: Parameters, completion: @escaping(JSON)->Void){
        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: createHeaders()).responseJSON { (responseObject) in
            
            if responseObject.result.isSuccess{
                let jsonObject = JSON(responseObject.result.value ?? JSON())
                completion(jsonObject)
            } else{
                let error = responseObject.result.error?.localizedDescription ?? "Error"
                print(error)
                completion(JSON(error))
            }
        }
    }

}
