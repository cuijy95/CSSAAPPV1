//
//  FirstPageViewController.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-04.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    let postImagesView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sampleImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let postsContainerView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.white
        view.contentSize.height = 1000 //todo: change to dynamic height
        view.isScrollEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let post1View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title..."
        label.backgroundColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "contents..."
        label.backgroundColor = UIColor.green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "首页"
        view.backgroundColor = UIColor.black
        
        view.addSubview(postImagesView)
        view.addSubview(postsContainerView)
        
        setupPostImagesView()
        setupPostsContainerView()
    }
    
    func setupPostImagesView(){
        postImagesView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postImagesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        postImagesView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        postImagesView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupPostsContainerView() {
        postsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        postsContainerView.topAnchor.constraint(equalTo: postImagesView.bottomAnchor, constant: 12).isActive = true
        postsContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        
        postsContainerView.addSubview(post1View)
        setupPost1View()
    }
    
    func setupPost1View() {
        post1View.centerXAnchor.constraint(equalTo: postsContainerView.centerXAnchor).isActive = true
        post1View.topAnchor.constraint(equalTo: postsContainerView.topAnchor, constant: 12).isActive = true
        post1View.widthAnchor.constraint(equalTo: postsContainerView.widthAnchor, constant: -12).isActive = true
        post1View.heightAnchor.constraint(equalTo: postsContainerView.heightAnchor).isActive = true
    }
}
