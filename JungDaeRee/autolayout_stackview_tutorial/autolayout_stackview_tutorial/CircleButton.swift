//
//  CircleButton.swift
//  autolayout_stackview_tutorial
//
//  Created by Taejun Ha on 2023/09/04.
//

import Foundation
import UIKit

// IBDesignable은 인터페이스 빌더에서 디자인으로 확인 가능하게끔 하는 것
@IBDesignable
class CircleButton: UIButton {
    
    // IBInspectable은 스토리보드의 인스펙터 패널에서 사용될 수 있도록 설정하는 것
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}

