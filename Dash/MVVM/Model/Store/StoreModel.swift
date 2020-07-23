//
//  StoreModel.swift
//
//  Created by Omeesh Sharma on 23/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct StoreModel {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kStoreModelNameKey: String = "name"
  private let kStoreModelRatingCountKey: String = "ratingCount"
  private let kStoreModelOpenTimeKey: String = "openTime"
  private let kStoreModelDiscountUptoKey: String = "discountUpto"
  private let kStoreModelDiscountKey: String = "discount"
  private let kStoreModelDescriptionValueKey: String = "description"
  private let kStoreModelAvgOrderPriceKey: String = "avgOrderPrice"
  private let kStoreModelIsFavouriteKey: String = "isFavourite"
  private let kStoreModelAvgDeliveryTimeKey: String = "avgDeliveryTime"
  private let kStoreModelCloseTimeKey: String = "closeTime"
  private let kStoreModelStatusKey: String = "status"
  private let kStoreModelInternalIdentifierKey: String = "_id"
  private let kStoreModelCategoriesKey: String = "categories"
  private let kStoreModelRatingsKey: String = "ratings"
  private let kStoreModelImageKey: String = "image"
  private let kStoreModelFoodTypeKey: String = "foodType"
  private let kStoreModelOutletSizeKey: String = "outletSize"
  private let kStoreModelOutletsKey: String = "outlets"

  // MARK: Properties
  public var name: String?
  public var ratingCount: Int?
  public var openTime: String?
  public var discountUpto: Int?
  public var discount: Int?
  public var descriptionValue: String?
  public var avgOrderPrice: Int?
  public var isFavourite: Int?
  public var avgDeliveryTime: Int?
  public var closeTime: String?
  public var status: Int?
  public var internalIdentifier: String?
  public var categories: [StoreCategories]?
  public var ratings: Float?
  public var image: String?
  public var foodType: Int?
  public var outletSize: Int?
  public var outlets: [StoreOutlets]?

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
    name = json[kStoreModelNameKey].string
    ratingCount = json[kStoreModelRatingCountKey].int
    openTime = json[kStoreModelOpenTimeKey].string
    discountUpto = json[kStoreModelDiscountUptoKey].int
    discount = json[kStoreModelDiscountKey].int
    descriptionValue = json[kStoreModelDescriptionValueKey].string
    avgOrderPrice = json[kStoreModelAvgOrderPriceKey].int
    isFavourite = json[kStoreModelIsFavouriteKey].int
    avgDeliveryTime = json[kStoreModelAvgDeliveryTimeKey].int
    closeTime = json[kStoreModelCloseTimeKey].string
    status = json[kStoreModelStatusKey].int
    internalIdentifier = json[kStoreModelInternalIdentifierKey].string
    if let items = json[kStoreModelCategoriesKey].array { categories = items.map { StoreCategories(json: $0) } }
    ratings = json[kStoreModelRatingsKey].float
    image = json[kStoreModelImageKey].string
    foodType = json[kStoreModelFoodTypeKey].int
    outletSize = json[kStoreModelOutletSizeKey].int
    if let items = json[kStoreModelOutletsKey].array { outlets = items.map { StoreOutlets(json: $0) } }
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kStoreModelNameKey] = value }
    if let value = ratingCount { dictionary[kStoreModelRatingCountKey] = value }
    if let value = openTime { dictionary[kStoreModelOpenTimeKey] = value }
    if let value = discountUpto { dictionary[kStoreModelDiscountUptoKey] = value }
    if let value = discount { dictionary[kStoreModelDiscountKey] = value }
    if let value = descriptionValue { dictionary[kStoreModelDescriptionValueKey] = value }
    if let value = avgOrderPrice { dictionary[kStoreModelAvgOrderPriceKey] = value }
    if let value = isFavourite { dictionary[kStoreModelIsFavouriteKey] = value }
    if let value = avgDeliveryTime { dictionary[kStoreModelAvgDeliveryTimeKey] = value }
    if let value = closeTime { dictionary[kStoreModelCloseTimeKey] = value }
    if let value = status { dictionary[kStoreModelStatusKey] = value }
    if let value = internalIdentifier { dictionary[kStoreModelInternalIdentifierKey] = value }
    if let value = categories { dictionary[kStoreModelCategoriesKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = ratings { dictionary[kStoreModelRatingsKey] = value }
    if let value = image { dictionary[kStoreModelImageKey] = value }
    if let value = foodType { dictionary[kStoreModelFoodTypeKey] = value }
    if let value = outletSize { dictionary[kStoreModelOutletSizeKey] = value }
    if let value = outlets { dictionary[kStoreModelOutletsKey] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
