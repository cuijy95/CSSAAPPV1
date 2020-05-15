//
//  ActivityViewController.swift
//  CssaAppV1
//
//  Created by Jianyu Cui on 2020-03-08.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    var activityObjects = [ActivityPage]()

    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ActivityCell.self,forCellWithReuseIdentifier: "activityCell")
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "活动资讯"
        view.backgroundColor = .white
        view.addSubview(collectionView)
        setupCollectionView()
        
        activityObjects.append(ActivityPage(activityTitle: "sample Title 1", activitySubTitle: "sample subtitle 1", activityImage: "sampleImage"))
        activityObjects.append(ActivityPage(activityTitle: "sample Title 2", activitySubTitle: "sample subtitle 2", activityImage: "sampleImage2"))
        activityObjects.append(ActivityPage(activityTitle: "sample Title 3", activitySubTitle: "sample subtitle 3", activityImage: "date1"))
        activityObjects.append(ActivityPage(activityTitle: "sample Title 4", activitySubTitle: "sample subtitle 4", activityImage: "date2"))
        activityObjects.append(ActivityPage(activityTitle: "sample Title 5", activitySubTitle: "sample subtitle 5", activityImage: "date3"))
        activityObjects.append(ActivityPage(activityTitle: "sample Title 6", activitySubTitle: "sample subtitle 6", activityImage: "sampleImage"))
        activityObjects.append(ActivityPage(activityTitle: "sample Title 7", activitySubTitle: "sample subtitle 7", activityImage: "sampleImage2"))
        
        // Do any additional setup after loading the view.
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
    
    extension ActivityViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
        
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
            return activityObjects.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityCell", for: indexPath) as! ActivityCell
            cell.backgroundColor = .yellow
            cell.activityObjects = self.activityObjects[indexPath.row]
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let contentController = ActivityContentViewController()
            self.navigationController?.pushViewController(contentController, animated: false)
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
    class ActivityCell:UICollectionViewCell {
        var activityObjects: ActivityPage?{
            didSet{
                guard let activityObjects = activityObjects else {
                    return
                }
                activityImage.image = UIImage(named: activityObjects.getImage())
                activityTitleLabel.text = activityObjects.getTitle()
                activitySubTitleLabel.text = activityObjects.getSubTitle()
            }
        }
        
        let activityImage : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.masksToBounds = true
            return imageView
        }()
        
        let activityTitleLabel : UILabel = {
            let label = UILabel()
            label.backgroundColor = .red
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let activitySubTitleLabel : UILabel = {
            let label = UILabel()
            label.backgroundColor = .blue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame:frame)
            
            contentView.addSubview(activityImage)
            setupImage()
            contentView.addSubview(activityTitleLabel)
            setupTitle()
            contentView.addSubview(activitySubTitleLabel)
            setupSubTitle()
            
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        func setupImage() {
            activityImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            activityImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            activityImage.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
            activityImage.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 1/3).isActive = true
        }
        
        func setupTitle() {
            activityTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            activityTitleLabel.leadingAnchor.constraint(equalTo: activityImage.trailingAnchor,constant: 20).isActive = true
            activityTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 2/3).isActive = true
            activityTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true
        }
        
        func setupSubTitle() {
            activitySubTitleLabel.topAnchor.constraint(equalTo: activityTitleLabel.bottomAnchor).isActive = true
            activitySubTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            activitySubTitleLabel.leadingAnchor.constraint(equalTo: activityImage.trailingAnchor,constant: 20).isActive = true
            activitySubTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 1/3).isActive = true
            activitySubTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true
        }
    }

