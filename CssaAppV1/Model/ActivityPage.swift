//
//  File.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-08.
//  Copyright © 2020 CSSA. All rights reserved.
//

import Foundation
import UIKit

class ActivityPage {
    private var activityTitle: String
    private var activitySubTitle: String
    private var activityImage: String
    
    init(activityTitle: String,activitySubTitle: String,activityImage: String) {
        self.activityTitle = activityTitle
        self.activitySubTitle = activitySubTitle
        self.activityImage = activityImage
    }
    
    func getTitle() -> String {
        return self.activityTitle
    }
    
    func getSubTitle() -> String {
        return self.activitySubTitle
    }
    
    func getImage() -> String {
        return self.activityImage
    }
    func setTitle(title:String) {
        self.activityTitle = title
    }
    
    func setSubTitle(subTitle:String) {
        self.activitySubTitle = subTitle
    }
    
    func setImage(image:String) {
        self.activityImage = image
    }
}
