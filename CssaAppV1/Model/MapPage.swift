//
//  MapPage.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-11.
//  Copyright © 2020 CSSA. All rights reserved.
//

import Foundation
import UIKit

class MapPage {
    private var mapImage : String
    
    init(mapImage : String){
        self.mapImage = mapImage
    }
    
    func getMapImage() -> String {
        return self.mapImage
    }
}
