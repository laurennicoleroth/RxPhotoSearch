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
  
  func getPhotoThumbnailURL() -> String {
    return "https://farm\(farm!).staticflickr.com/\(server!)/\(photoID!)_\(secret!)_m.jpg"
  }
  
  
}

