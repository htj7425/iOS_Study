//
//  View2Controller.swift
//  View2Controller
//
//  Created by Taejun Ha on 2023/08/24.
//

import UIKit

class View2Controller: UIViewController {
    
    let view_1 = UIView()
    let view_2 = UIView()
    let view_3 = UIView()
    let view_4 = UIView()
    let view_5 = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view_1)
        view.addSubview(view_2)
        view.addSubview(view_3)
        view.addSubview(view_4)
        view.addSubview(view_5)
        
        view_1.translatesAutoresizingMaskIntoConstraints = false
        view_1.backgroundColor = UIColor.black
        view_1.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 100).isActive = true
        view_1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view_2.translatesAutoresizingMaskIntoConstraints = false
        view_2.backgroundColor = UIColor.purple
        view_2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view_2.heightAnchor.constraint(equalToConstant: view.bounds.size.height - 100).isActive = true
        view_2.leftAnchor.constraint(equalTo: view_1.rightAnchor).isActive = true
        
        view_3.backgroundColor = UIColor.brown
        view_3.translatesAutoresizingMaskIntoConstraints = false
        view_3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view_3.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 100).isActive = true
        view_3.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view_3.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view_4.backgroundColor = UIColor.blue
        view_4.translatesAutoresizingMaskIntoConstraints = false
        view_4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view_4.heightAnchor.constraint(equalToConstant: view.bounds.size.height - 100).isActive = true
        view_4.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view_4.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view_5.translatesAutoresizingMaskIntoConstraints = false
        view_5.backgroundColor = UIColor.yellow
        view_5.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 200).isActive = true
        view_5.heightAnchor.constraint(equalToConstant: view.bounds.size.height - 200).isActive = true
        view_5.topAnchor.constraint(equalTo: view_1.bottomAnchor).isActive = true
        view_5.leftAnchor.constraint(equalTo:view_4.rightAnchor).isActive = true
        
    }
}
