//
//  CssaPage.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-06.
//  Copyright © 2020 CSSA. All rights reserved.
//

import Foundation
import UIKit

class CssaPage {
    private var cssaPageText: String
    private var cssaPageImage: String
    
    init(cssaPageText: String, cssaPageImage: String) {
        self.cssaPageText = cssaPageText
        self.cssaPageImage = cssaPageImage
    }
    
    func getCssaPageText() -> String {
        return self.cssaPageText
    }
    
    func getCssaPageImage() -> String {
        return self.cssaPageImage
    }
}
