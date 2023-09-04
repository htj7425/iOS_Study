//
//  MyTableViewCell.swift
//  dynamic_table_view_tutorial
//
//  Created by Taejun Ha on 2023/09/03.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var thumbBtn: UIButton!
    
    
    @IBAction func heartBtn(_ sender: Any) {
        heartBtn.tintColor = UIColor.red
    }
    @IBAction func thumbBtn(_ sender: Any) {
        thumbBtn.tintColor = UIColor.systemBlue
    }
    
    //셀이 랜더링(그릴때) 될때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //셀이 그려질 때 여기서 UI에 대한 커스텀 작업이 가능함
        print("MyTableViewCell - awakeFromNib() called")

        userProfileImg.layer.cornerRadius = userProfileImg.frame.height/2
        
        
    }
}
