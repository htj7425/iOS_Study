//
//  ViewController.swift
//  HaulScrollView
//
//  Created by Taejun Ha on 2023/08/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let images = [#imageLiteral(resourceName: "image_3"), #imageLiteral(resourceName: "image_1"), #imageLiteral(resourceName: "image_2")]
        
        for i in 0..<images.count{
            let imageView = UIImageView()
            imageView.image = images[i]
            imageView.contentMode = .scaleAspectFit
            
            // x:0 y:0
            // x:100 y:0
            // x:200 y:0
            // 위 숫자는 예시임  
            //이렇게 좌표 지정할 수 있게 xPosition을 for문으로 계산함
            let xPosition = self.view.frame.width * CGFloat(i)
            
            //위에서 계산한 x좌표를 여기서 넣어줌
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
            //scrollview의 페이지 수를 정해주는 코드
            scrollView.contentSize.width = self.view.frame.width*CGFloat(1+i)
            
            //scrollView에 imageview 추가
            scrollView.addSubview(imageView)
        }
    }


}

