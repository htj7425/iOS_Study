//
//  ViewController.swift
//  HaulTableViewKakao
//
//  Created by Taejun Ha on 2023/08/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Users = [UserDTO]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath) as! CustomCell
        
        cell.profileImage.image = UIImage(named: Users[indexPath.row].image)
        cell.profileImage.layer.cornerRadius = (cell.profileImage.frame.width)/2
        cell.profileImage.layer.masksToBounds = true  
        
        cell.profileName.text = Users[indexPath.row].name
        cell.profileMessage.text = Users[indexPath.row].message
        
        cell.bubleSpeech.translatesAutoresizingMaskIntoConstraints = false
        cell.bubleSpeech.leftAnchor.constraint(equalTo: cell.profileMessage.leftAnchor, constant: -10).isActive = true
        cell.bubleSpeech.topAnchor.constraint(equalTo: cell.profileMessage.topAnchor, constant: -10).isActive = true
        cell.bubleSpeech.rightAnchor.constraint(equalTo: cell.profileMessage.rightAnchor, constant: 10).isActive = true
        cell.bubleSpeech.bottomAnchor.constraint(equalTo: cell.profileMessage.bottomAnchor, constant: 10).isActive = true
        cell.bubleSpeech.layer.cornerRadius = 20
        cell.bubleSpeech.layer.masksToBounds = true
        cell.bubleSpeech.layer.borderWidth = 0.3
        
        

        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Users.append(UserDTO(image: "image_1", name: "김갑수", message: "뿌링클 먹고싶다"))
        Users.append(UserDTO(image: "image_2", name: "최명숙", message: "불닭에 스팸 버억"))
        Users.append(UserDTO(image: "image_3", name: "곽막례", message: "삼겹살 지글지글"))
    }
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileMessage: UILabel!
    @IBOutlet weak var bubleSpeech: UIView!
}
