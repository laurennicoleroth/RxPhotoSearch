//
//  Photo.swift
//  IVYRxPhotos
//
//  Created by Lauren Nicole Roth on 9/6/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Photo {
  let farm: String?
  let ownerID: String?
  let photoID: String?
  let secret: String?
  let server: String?
  let title: String?
  
  init(jsonDictionary : JSON) {
    self.title = jsonDictionary["title"].stringValue
    self.farm = jsonDictionary["farm"].stringValue
    self.ownerID = jsonDictionary["owner"].stringValue
    self.photoID = jsonDictionary["id"].stringValue
    self.secret = jsonDictionary["secret"].stringValue
    self.server = jsonDictionary["server"].stringValue
  }
  
  func getPhotoThumbnailURL() -> String {
    return "https://farm\(farm!).staticflickr.com/\(server!)/\(photoID!)_\(secret!)_m.jpg"
  }
  
  func getLargePhotoURL() -> String {
    return "https://farm\(farm!).staticflickr.com/\(server!)/\(photoID!)_\(secret!)_b.jpg"
  }
  
  
}

