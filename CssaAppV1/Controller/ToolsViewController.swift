//
//  ToolsViewController.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-05.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController {

    let mapButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("地图", for:  .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(mapPressed), for:.touchUpInside)
        return button
    }()
    
    let dateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("重要日期", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(datePressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "工具"
        view.backgroundColor = UIColor.white
        view.addSubview(mapButton)
        view.addSubview(dateButton)
        
        setupmapButton()
        setupdateButton()
        // Do any additional setup after loading the view.
    }
    

    func setupmapButton() {
        mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -100).isActive = true
        mapButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mapButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupdateButton() {
        dateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 100).isActive = true
        dateButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        dateButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func mapPressed() {
//        let mapviewcontroller = MapViewController()
        self.navigationController?.pushViewController(MapViewController(), animated: true)
    }
    
    @objc func datePressed() {
        self.navigationController?.pushViewController(DateViewController(), animated: true)
//        let datecontroller = DateViewController()
//        presentedViewController(datecontroller, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
