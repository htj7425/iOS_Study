//
//  ViewController.swift
//  HaulCollectionView
//
//  Created by Taejun Ha on 2023/08/26.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    let images = [UIImage(named: "image_1"), UIImage(named: "image_2"), UIImage(named: "image_3")]
    let images = [#imageLiteral(resourceName: "image_1"), #imageLiteral(resourceName: "image_2"), #imageLiteral(resourceName: "image_3"), #imageLiteral(resourceName: "image_1"), #imageLiteral(resourceName: "image_2"), #imageLiteral(resourceName: "image_3"), #imageLiteral(resourceName: "image_1"), #imageLiteral(resourceName: "image_2"), #imageLiteral(resourceName: "image_3"), #imageLiteral(resourceName: "image_1"), #imageLiteral(resourceName: "image_2"), #imageLiteral(resourceName: "image_3"),]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //이미지 카운터하는 function
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //이미지를 넣는 function
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        
        cell.imageView.image = images[indexPath.row]
        
        return cell
         
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.size.width/3.05
        
        return CGSize(width: width, height: width)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        //컬렉션뷰 행 하단 여백
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        //컬렉션뷰 컬럼사이 여백
        return 1
    }
    
}

class CustomCell: UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
}
