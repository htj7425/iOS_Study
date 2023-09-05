////
////  ViewController.swift
////  autolayout_stackview_tutorial
////
////  Created by Taejun Ha on 2023/09/04.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var HStackView: UIStackView!
//
//    @IBOutlet weak var numberLabel: UILabel!
//
//    @IBAction func btn_1(_ sender: Any) {
//        numberLabel.text?.append("1")
//    }
//    @IBAction func btn_2(_ sender: Any) {
//        numberLabel.text?.append("2")
//    }
//    @IBAction func btn_3(_ sender: Any) {
//        numberLabel.text?.append("3")
//    }
//    @IBAction func btn_4(_ sender: Any) {
//        numberLabel.text?.append("4")
//    }
//    @IBAction func btn_5(_ sender: Any) {
//        numberLabel.text?.append("5")
//    }
//    @IBAction func btn_6(_ sender: Any) {
//        numberLabel.text?.append("6")
//    }
//    @IBAction func btn_7(_ sender: Any) {
//        numberLabel.text?.append("7")
//    }
//    @IBAction func btn_8(_ sender: Any) {
//        numberLabel.text?.append("8")
//    }
//    @IBAction func btn_9(_ sender: Any) {
//        numberLabel.text?.append("9")
//    }
//    @IBAction func btn_0(_ sender: Any) {
//        numberLabel.text?.append("0")
//    }
//    @IBAction func btn_a(_ sender: Any) {
//        numberLabel.text?.append("*")
//    }
//    @IBAction func btn_s(_ sender: Any) {
//        numberLabel.text?.append("#")
//    }
//    @IBAction func btn_call(_ sender: Any) {
//        numberLabel.text = ""
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        for VStack in HStackView.arrangedSubviews {
//            let temp = VStack as! UIStackView
//            for btn in temp.arrangedSubviews {
//                btn.layer.cornerRadius = btn.frame.width/2
//            }
//        }
//    }
//}

//
//  ViewController.swift
//  autolayout_stackview_tutorial
//
//  Created by Taejun Ha on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var phoneNumberLabel: UILabel!

    @IBOutlet var phoneNumberBtns: [CircleButton]!
    @IBOutlet weak var phoneCallBtn: CircleButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
        
    @IBAction func deleteBtn(_ sender: Any) {
        phoneNumberString.removeLast()
        deleteBtn.tintColor = UIColor.systemGray6
        
        UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {self.deleteBtn.tintColor = UIColor.darkGray})
    }
    
    
    var phoneNumberString = "" {
        didSet{
            DispatchQueue.main.async{[weak self] in
                guard let self = self else {return}
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
                
                if phoneNumberString.count == 0 {
                    btnHidden(view: deleteBtn, hidden: true)
                }
                else {
                    btnHidden(view: deleteBtn, hidden: false)
                }
            }
        }
    }
    
    func btnHidden(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 1, options: [.transitionCrossDissolve, .allowUserInteraction], animations: {view.isHidden = hidden})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        for btnItem in phoneNumberBtns {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        
        phoneCallBtn.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
        
        deleteBtn.isHidden = true
        
    }
    
    @objc fileprivate func onNumberBtnClicked(sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else {return}
        phoneNumberString.append(inputString)
        sender.backgroundColor = UIColor.white
        
        UIButton.animate(withDuration: 1.4, delay: 0, options: .allowUserInteraction,animations: {sender.backgroundColor = UIColor.systemGray5})
    }
    
    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton) {
        phoneNumberString.removeAll()
        
        sender.backgroundColor = UIColor.green
        
        UIButton.animate(withDuration: 1.4, delay: 0, options: .allowUserInteraction, animations: {sender.backgroundColor = UIColor.systemGreen})
    }
}

