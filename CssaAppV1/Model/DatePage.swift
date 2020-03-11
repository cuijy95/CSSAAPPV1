//
//  DatePage.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-11.
//  Copyright © 2020 CSSA. All rights reserved.
//

import Foundation
import UIKit

class DatePage{
    
    private var dateImages : [String]
    
    init(dateImages:[String]){
        self.dateImages = dateImages
    }
    func getDateImages() -> [String]{
        return self.dateImages
    }
}
