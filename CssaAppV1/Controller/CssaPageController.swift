//
//  CssaPageController.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-06.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class CssaPageController: UIViewController {
    
    var cssaPageObjects = [CssaPage]()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CssaPageCell.self, forCellWithReuseIdentifier: "cssaCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "学生会"
        view.backgroundColor = .white
        view.addSubview(collectionView)
        setupCollectionView()
        
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 1", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 2", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 3", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 4", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 5", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 6", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 7", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 8", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 9", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 10", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 11", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 12", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 13", cssaPageImage: "sampleImage2"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 14", cssaPageImage: "sampleImage"))
        cssaPageObjects.append(CssaPage(cssaPageText: "sample text 15", cssaPageImage: "sampleImage2"))
    }
    
    func setupCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}

extension CssaPageController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-32, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cssaPageObjects.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cssaCell", for: indexPath) as! CssaPageCell
        cell.backgroundColor = .yellow
        cell.cssaPageObject = self.cssaPageObjects[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contentController = CssaPageContentController()
        self.navigationController?.pushViewController(contentController, animated: false)
    }
}

class CssaPageCell: UICollectionViewCell {
    
    var cssaPageObject: CssaPage?{
        didSet{
            guard let cssaPageObject = cssaPageObject else {
                return
            }
            cssaImage.image = UIImage(named: cssaPageObject.getCssaPageImage())
            cssaLabel.text = cssaPageObject.getCssaPageText()
        }
    }
    
    let cssaImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 12
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let cssaLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cssaImage)
        setupCssaImageView()
        contentView.addSubview(cssaLabel)
        setupCssaLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCssaImageView(){
        cssaImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cssaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cssaImage.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        cssaImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/4).isActive = true
    }
    
    func setupCssaLabel(){
        cssaLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cssaLabel.leadingAnchor.constraint(equalTo: cssaImage.trailingAnchor, constant: 20).isActive = true
        cssaLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cssaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
