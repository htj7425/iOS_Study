//
//  ViewController.swift
//  HaulTableView
//
//  Created by Taejun Ha on 2023/08/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,
    UITableViewDataSource {
    
    let images = ["orange.jpeg", "strawberry.jpeg", "apple.gif"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell", for: indexPath) as! RowDTO
        
        cell.rowImage.image = UIImage(named: images[indexPath.row])
        cell.rowLabel.text = images[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}


class RowDTO: UITableViewCell {
    
    @IBOutlet weak var rowImage: UIImageView!
    @IBOutlet weak var rowLabel: UILabel!
    
}
