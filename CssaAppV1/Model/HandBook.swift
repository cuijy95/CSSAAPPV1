//
//  HandBook.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-05.
//  Copyright © 2020 CSSA. All rights reserved.
//

import Foundation

class HandBook {
    private var catalog: String
    
    init(catalog: String) {
        self.catalog = catalog
    }
    
    func getCatalog() -> String {
        return self.catalog
    }
}
