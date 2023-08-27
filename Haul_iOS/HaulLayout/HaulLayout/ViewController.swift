//
//  ViewController.swift
//  HaulLayout
//
//  Created by Taejun Ha on 2023/08/24.
//

import UIKit

class ViewController: UIViewController {

    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()
    
    let fivethView = UIView()
    let sixthView = UIView()
    let seventhView = UIView()
    let eightthView = UIView()
    let ninethView = UIView()
    let tenthView = UIView()
    let elevenView = UIView()
    let twelveView = UIView()
    let thirdteenthView = UIView()
    let fourteenthView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //view에 각 subView들을 추가
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(fourthView)
        
        //각 subView들의 설정 셋팅
        setLayoutDetailAttribute()

        
        //각 detailView
        setSubLayout(subView: fivethView, anchorView: firstView)
        setSubLayout(subView: sixthView, anchorView: firstView)
        setSubLayout(subView: seventhView, anchorView: secondView)
        setSubLayout(subView: eightthView, anchorView: secondView)
        setSubLayout(subView: ninethView, anchorView: thirdView)
        setSubLayout(subView: tenthView, anchorView: thirdView)
        
        setSubLayoutDetailAttribute()
        
        setLastLineLayout()
        }
        
    func setLayout(superView: UIView, h: Double = 0.3){
        superView.translatesAutoresizingMaskIntoConstraints = false
        superView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * h).isActive = true
        superView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
    }
    
    func setLayoutDetailAttribute() {
        setLayout(superView: firstView)
        firstView.backgroundColor = UIColor.black
        
        setLayout(superView: secondView)
        secondView.backgroundColor = UIColor.blue
        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
        
        setLayout(superView: thirdView)
        thirdView.backgroundColor = UIColor.brown
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
        
        setLayout(superView: fourthView, h: 0.1)
        fourthView.backgroundColor = UIColor.purple
        fourthView.topAnchor.constraint(equalTo: thirdView.bottomAnchor).isActive = true
    }
    
    func setSubLayout(subView: UIView, anchorView: UIView) {
        //view add
        anchorView.addSubview(subView)
        
        //size setting
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.heightAnchor.constraint(equalTo: anchorView.heightAnchor).isActive = true
        subView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/2).isActive = true
    }
    
    func setSubLayoutDetailAttribute() {
        // color, position setting
        fivethView.backgroundColor = UIColor.white
        
        sixthView.backgroundColor = UIColor.orange
        sixthView.leftAnchor.constraint(equalTo: fivethView.rightAnchor).isActive = true
        
        seventhView.backgroundColor = UIColor.orange
        
        eightthView.backgroundColor = UIColor.white
        eightthView.leftAnchor.constraint(equalTo: seventhView.rightAnchor).isActive = true
        
        ninethView.backgroundColor = UIColor.white

        tenthView.backgroundColor = UIColor.orange
        tenthView.leftAnchor.constraint(equalTo: ninethView.rightAnchor).isActive = true
    }
    
    func setLastLineLayout() {
        fourthView.addSubview(elevenView)
        fourthView.addSubview(twelveView)
        fourthView.addSubview(thirdteenthView)
        fourthView.addSubview(fourteenthView)
        
        elevenView.translatesAutoresizingMaskIntoConstraints = false
        elevenView.heightAnchor.constraint(equalTo: fourthView.heightAnchor).isActive = true
        elevenView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/4).isActive = true
        elevenView.backgroundColor = UIColor.black
        
        twelveView.translatesAutoresizingMaskIntoConstraints = false
        twelveView.heightAnchor.constraint(equalTo: fourthView.heightAnchor).isActive = true
        twelveView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/4).isActive = true
        twelveView.leftAnchor.constraint(equalTo: elevenView.rightAnchor).isActive = true
        twelveView.backgroundColor = UIColor.blue
        
        thirdteenthView.translatesAutoresizingMaskIntoConstraints = false
        thirdteenthView.heightAnchor.constraint(equalTo: fourthView.heightAnchor).isActive = true
        thirdteenthView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/4).isActive = true
        thirdteenthView.leftAnchor.constraint(equalTo: twelveView.rightAnchor).isActive = true
        thirdteenthView.backgroundColor = UIColor.red
        
        fourteenthView.translatesAutoresizingMaskIntoConstraints = false
        fourteenthView.heightAnchor.constraint(equalTo: fourthView.heightAnchor).isActive = true
        fourteenthView.widthAnchor.constraint(equalToConstant: view.bounds.size.width/4).isActive = true
        fourteenthView.leftAnchor.constraint(equalTo: thirdteenthView.rightAnchor).isActive = true
        fourteenthView.backgroundColor = UIColor.green
    }
}
