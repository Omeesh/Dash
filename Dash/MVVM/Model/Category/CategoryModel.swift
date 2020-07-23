//
//  CategoryModel.swift
//
//  Created by Omeesh Sharma on 23/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct CategoryModel {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCategoryModelNameKey: String = "name"
  private let kCategoryModelInternalIdentifierKey: String = "_id"
  private let kCategoryModelImageKey: String = "image"
  private let kCategoryModelRestaurantsKey: String = "restaurants"

  // MARK: Properties
  public var name: String?
  public var internalIdentifier: String?
  public var image: String?
  public var restaurants: Int?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    name = json[kCategoryModelNameKey].string
    internalIdentifier = json[kCategoryModelInternalIdentifierKey].string
    image = json[kCategoryModelImageKey].string
    restaurants = json[kCategoryModelRestaurantsKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kCategoryModelNameKey] = value }
    if let value = internalIdentifier { dictionary[kCategoryModelInternalIdentifierKey] = value }
    if let value = image { dictionary[kCategoryModelImageKey] = value }
    if let value = restaurants { dictionary[kCategoryModelRestaurantsKey] = value }
    return dictionary
  }

}
