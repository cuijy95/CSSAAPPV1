//
//  FirstPageViewController.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-04.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class FirstPageViewController: UIViewController {
    
    var remoteImage : UIImage?
    
    let postImagesView: UIScrollView = {
        let scrollimageView = UIScrollView()
        scrollimageView.translatesAutoresizingMaskIntoConstraints = false
        scrollimageView.layer.cornerRadius = 8
        scrollimageView.layer.masksToBounds = true
        scrollimageView.isPagingEnabled = true
        return scrollimageView
    }()
    
    let postsContainerView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let post1View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleText1: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.text = "公告1"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let contentText1: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.text = "公告1内容"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let post2View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleText2: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.text = "公告2"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let contentText2: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.text = "公告2内容"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "首页"
        view.backgroundColor = UIColor.black
        
        fetchFirsPageModel()
        
        view.addSubview(postsContainerView)
        setupPostsContainerView()
        
    }
    
    func fetchFirsPageModel(){
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("FistPageModels").child("model1").observe(DataEventType.value) { (snapshot) in
            //get FirstPage model
            let value = snapshot.value as? NSDictionary
            let post1Content = value?["post1Content"] as? String ?? ""
            let post1Title = value?["post1Title"] as? String ?? ""
            let post2Content = value?["post2Content"] as? String ?? ""
            let post2Title = value?["post2Title"] as? String ?? ""
            let scrollImages = value?["scrollImages"] as? [String] ?? [""]
            let firstPageModel = FirstPage(scrollImages: scrollImages, post1Title: post1Title, post1Content: post1Content, post2Title: post2Title, post2Content: post2Content)
            
            self.setupRemoteFirstPage(firstPageModel: firstPageModel)
        }
    }
    
    func setupRemoteFirstPage(firstPageModel : FirstPage){
        titleText1.text = firstPageModel.getPost1Title()
        contentText1.text = firstPageModel.getPost1Content()
        titleText2.text = firstPageModel.getPost2Title()
        contentText2.text = firstPageModel.getPost2Content()
        //TODO: set remote image
        let url = URL(string: "https://www.guiamania.com/wp-content/uploads/2009/09/31-180x180.jpg")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                self.remoteImage = UIImage(data: data!)
                self.processScrollImageView()
            }
            
        }.resume()
    }
    
    func setupPostsContainerView() {
        postsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        postsContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        postsContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        postsContainerView.addSubview(postImagesView)
        setupPostImagesView()
        postsContainerView.addSubview(post1View)
        setupPost1View()
        postsContainerView.addSubview(post2View)
        setupPost2View()
    }
    
    func setupPostImagesView(){
        postImagesView.centerXAnchor.constraint(equalTo: postsContainerView.centerXAnchor).isActive = true
        postImagesView.topAnchor.constraint(equalTo: postsContainerView.topAnchor, constant: 12).isActive = true
        postImagesView.widthAnchor.constraint(equalTo: postsContainerView.widthAnchor, constant: -12).isActive = true
        postImagesView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupPost1View() {
        post1View.addSubview(titleText1)
        post1View.addSubview(contentText1)
        setupPost1Texts()
        
        post1View.centerXAnchor.constraint(equalTo: postsContainerView.centerXAnchor).isActive = true
        post1View.topAnchor.constraint(equalTo: postImagesView.bottomAnchor, constant: 12).isActive = true
        post1View.widthAnchor.constraint(equalTo: postsContainerView.widthAnchor, constant: -12).isActive = true
        post1View.bottomAnchor.constraint(greaterThanOrEqualTo: contentText1.bottomAnchor, constant: 12).isActive = true
    }
    
    func setupPost1Texts() {
        titleText1.topAnchor.constraint(equalTo: post1View.topAnchor, constant: 12).isActive = true
        titleText1.leftAnchor.constraint(equalTo: post1View.leftAnchor, constant: 12).isActive = true
        titleText1.rightAnchor.constraint(equalTo: post1View.rightAnchor, constant: -12).isActive = true
        titleText1.bottomAnchor.constraint(equalTo: contentText1.topAnchor, constant: -12).isActive = true
        
        contentText1.topAnchor.constraint(equalTo: titleText1.bottomAnchor, constant: 12).isActive = true
        contentText1.leftAnchor.constraint(equalTo: post1View.leftAnchor, constant: 12).isActive = true
        contentText1.rightAnchor.constraint(equalTo: post1View.rightAnchor, constant: -12).isActive = true
        contentText1.bottomAnchor.constraint(equalTo: post1View.bottomAnchor, constant: -12).isActive = true
    }
    
    func setupPost2View() {
        post2View.addSubview(titleText2)
        post2View.addSubview(contentText2)
        setupPost2Texts()
        
        post2View.centerXAnchor.constraint(equalTo: postsContainerView.centerXAnchor).isActive = true
        post2View.topAnchor.constraint(equalTo: post1View.bottomAnchor, constant: 12).isActive = true
        post2View.widthAnchor.constraint(equalTo: postsContainerView.widthAnchor, constant: -12).isActive = true
        post2View.bottomAnchor.constraint(lessThanOrEqualTo: postsContainerView.bottomAnchor, constant: -12).isActive = true
    }

    func setupPost2Texts() {
        titleText2.topAnchor.constraint(equalTo: post2View.topAnchor, constant: 12).isActive = true
        titleText2.leftAnchor.constraint(equalTo: post2View.leftAnchor, constant: 12).isActive = true
        titleText2.rightAnchor.constraint(equalTo: post2View.rightAnchor, constant: -12).isActive = true
        titleText2.bottomAnchor.constraint(equalTo: contentText2.topAnchor, constant: -12).isActive = true
        
        contentText2.topAnchor.constraint(equalTo: titleText2.bottomAnchor, constant: 12).isActive = true
        contentText2.leftAnchor.constraint(equalTo: post2View.leftAnchor, constant: 12).isActive = true
        contentText2.rightAnchor.constraint(equalTo: post2View.rightAnchor, constant: -12).isActive = true
        contentText2.bottomAnchor.constraint(equalTo: post2View.bottomAnchor, constant: -12).isActive = true
    }
    
    func processScrollImageView(){
        var images = [UIImage]()
        images = [remoteImage!,UIImage(named:"date2")!,UIImage(named:"date3")!,UIImage(named:"date4")!]
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        for count in 0..<images.count{
            frame.origin.x = postImagesView.frame.size.width*CGFloat(count)
            frame.size = postImagesView.frame.size
            let imageView = UIImageView(frame:frame)
            imageView.image = images[count]
            imageView.layer.cornerRadius = 8
            imageView.layer.masksToBounds = true //圆角
            postImagesView.contentSize = CGSize(width: postImagesView.frame.width * CGFloat(images.count), height: postImagesView.frame.size.height)
            postImagesView.addSubview(imageView)
        }
    }
}
