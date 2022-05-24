//
//  ActivityModel.swift
//  WidgetDemo
//
//  Created by Vineet Kumar on 22/10/20.
//

import Foundation

// Suppose this model is coming from the api & is changing on timely basis
struct ActivityModel {
    let img: String
}

extension ActivityModel {
    static func placeholder() -> ActivityModel {
        ActivityModel(img: "🏏")
    }
    
    static func random() -> ActivityModel {
        let activitiesStr = ["🏏", "🏄", "🚵‍♀️", "🏊‍♀️", "🏌️", "🏋️‍♀️"]
        let activity = ActivityModel(img: activitiesStr.randomElement() ?? "🏏")
        return activity
    }
}

extension String {

  func decode() -> String {
      let data = self.data(using: .utf8)!
      return String(data: data, encoding: .nonLossyASCII) ?? self
  }

  func encode() -> String {
      let data = self.data(using: .nonLossyASCII, allowLossyConversion: true)!
      return String(data: data, encoding: .utf8)!
  }
}
