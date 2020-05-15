//
//  fistPage.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-09.
//  Copyright © 2020 CSSA. All rights reserved.
//

import Foundation
import UIKit

class FirstPage {
    private var scrollImages : [String]
    private var post1Title : String
    private var post1Content : String
    private var post2Title : String
    private var post2Content : String
    init(scrollImages : [String], post1Title:String,post1Content:String,post2Title:String,post2Content:String) {
        self.scrollImages = scrollImages
        self.post1Title = post1Title
        self.post1Content = post1Content
        self.post2Title = post2Title
        self.post2Content = post2Content
    }
    
    
    func getScrollImages() ->[String]{
        return self.scrollImages
    }
    func getPost1Title() -> String {
        return self.post1Title
    }
    func getPost1Content() -> String {
        return self.post1Content
    }
    func getPost2Title() -> String {
        return self.post2Title
    }
    func getPost2Content() -> String {
        return self.post2Content
    }
    
    
    func setScrollImage(scrollImage:[String]){
        self.scrollImages = scrollImage
    }
    func setPost1Title(post1Title:String){
        self.post1Title = post1Title
    }
    func setPost1Content(post1Content:String){
        self.post1Content = post1Content
    }
    func setPost2Title(post2Title:String){
        self.post2Title = post2Title
    }
    func setPost1Content(post2Content:String){
        self.post2Content = post2Content
    }

}
