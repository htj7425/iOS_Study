//
//  BaseVC.swift
//  API_storyboard_tutorial
//
//  Created by Taejun Ha on 11/27/23.
//

import UIKit

class BaseVC: UIViewController {
    var vcTitle: String = "" {
        // 처음엔 ""으로 값을 할당해주지만 후에 값이 바뀔 때 didSet이 수행됨
        didSet{
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
}
