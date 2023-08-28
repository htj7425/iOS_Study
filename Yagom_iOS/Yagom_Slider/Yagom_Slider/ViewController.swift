//
//  ViewController.swift
//  Yagom_Slider
//
//  Created by Taejun Ha on 2023/08/22.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    
    //Outlet은 스토리보드에 올려져있는 요소를 가져오고 싶을 때 사용
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(UIImage(imageLiteralResourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    //Action은 스토리보드에 올려져있는 요소의 이벤트를 담당
    @IBAction func sliderValueChanged(sender: UISlider ){
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)    }
    
    @IBAction func touchUpHitButton(sender:UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue{
            //print("YOU HIT!!")
            showAlert(message: "YOU HIT!!")
        } else if tryCount >= 5{
            //print("You lose...")
            showAlert(message: "You lose...")
        } else if hitValue > randomValue {
            maximumValueLabel.text = String(hitValue)
            slider.maximumValue = Float(hitValue)
        } else if hitValue < randomValue{
            minimumValueLabel.text = String(hitValue)
            slider.minimumValue = Float(hitValue)
        }
    }

    @IBAction func touchUpResetButton( sender: UIButton){
        print("touch up reset button")
        reset()
    }
    
    //Alert 하는법
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.setValue(15.0, animated: true)
        
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}
