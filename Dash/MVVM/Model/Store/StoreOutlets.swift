//
//  StoreOutlets.swift
//
//  Created by Omeesh Sharma on 23/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct StoreOutlets {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kStoreOutletsLatitudeKey: String = "latitude"
  private let kStoreOutletsDistanceKey: String = "distance"
  private let kStoreOutletsIsSelectedKey: String = "isSelected"
  private let kStoreOutletsInternalIdentifierKey: String = "_id"
  private let kStoreOutletsLongitudeKey: String = "longitude"
  private let kStoreOutletsAddressKey: String = "address"

  // MARK: Properties
  public var latitude: Float?
  public var distance: Float?
  public var isSelected: Bool = false
  public var internalIdentifier: String?
  public var longitude: Float?
  public var address: String?

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
    latitude = json[kStoreOutletsLatitudeKey].float
    distance = json[kStoreOutletsDistanceKey].float
    isSelected = json[kStoreOutletsIsSelectedKey].boolValue
    internalIdentifier = json[kStoreOutletsInternalIdentifierKey].string
    longitude = json[kStoreOutletsLongitudeKey].float
    address = json[kStoreOutletsAddressKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = latitude { dictionary[kStoreOutletsLatitudeKey] = value }
    if let value = distance { dictionary[kStoreOutletsDistanceKey] = value }
    dictionary[kStoreOutletsIsSelectedKey] = isSelected
    if let value = internalIdentifier { dictionary[kStoreOutletsInternalIdentifierKey] = value }
    if let value = longitude { dictionary[kStoreOutletsLongitudeKey] = value }
    if let value = address { dictionary[kStoreOutletsAddressKey] = value }
    return dictionary
  }

}
