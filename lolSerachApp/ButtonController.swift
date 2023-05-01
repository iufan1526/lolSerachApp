//
//  ButtonController.swift
//  lolSerachApp
//
//  Created by 김승태 on 2023/05/01.
//

import UIKit

class ButtonController: UIButton {
        
    @IBInspectable var cornerRedeus: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRedeus
        }
    }
}
