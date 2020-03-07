//
//  DateViewController.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-06.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    let dateImageView: UIScrollView = {
        let scorllImageView = UIScrollView()
        scorllImageView.translatesAutoresizingMaskIntoConstraints = false
        scorllImageView.isPagingEnabled = true
        scorllImageView.layer.cornerRadius = 8
        scorllImageView.layer.masksToBounds = true
        return scorllImageView
    }()

    override func viewDidLoad() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "工具", style: .plain, target: self, action: #selector(handleTools))
        super.viewDidLoad()
        navigationItem.title = "重要日期"
        // Do any additional setup after loading the view.
        view.addSubview(dateImageView)
        setupMapImageView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        processScrollImageView()
    }
    
    func setupMapImageView() {
        dateImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dateImageView.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -12).isActive = true
        dateImageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    
    @objc func handleTools() {
        let toolView = ToolsViewController()
        present(toolView, animated: true, completion: nil)
    }
    
    func processScrollImageView(){
        var images = [UIImage]()
        images = [UIImage(named:"date1")!,UIImage(named:"date2")!,UIImage(named:"date3")!,UIImage(named:"date4")!]
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        for count in 0..<images.count{
            frame.origin.x = dateImageView.frame.size.width*CGFloat(count)
            frame.size = dateImageView.frame.size
            let imageView = UIImageView(frame:frame)
            imageView.image = images[count]
            imageView.layer.cornerRadius = 8
            imageView.layer.masksToBounds = true //圆角
            dateImageView.contentSize = CGSize(width: dateImageView.frame.width * CGFloat(images.count), height: dateImageView.frame.size.height)
            dateImageView.addSubview(imageView)
        }
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
