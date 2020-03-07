//
//  MapViewController.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-05.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    let mapImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "map")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "地图"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "工具", style: .plain, target: self, action: #selector(handleTools))
        
        view.addSubview(mapImageView)
        setupMapImageView()
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(handleIndex))
    }
    
    func setupMapImageView() {
        mapImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mapImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        mapImageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    
    @objc func handleTools() {
        let toolController = ToolsViewController()
        present(toolController,animated: true, completion: nil)
    }
    
//    @objc func handleIndex() {
//        let indexController = ????
//        present(???,animated: true, completion: nil)
//    }
}
