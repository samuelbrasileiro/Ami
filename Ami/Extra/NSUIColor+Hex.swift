//
//  NSUIColor+Hex.swift
//  AppIOT
//
//  Created by Samuel on 01/05/19.
//  Copyright © 2019 Felipe Corte. All rights reserved.
//

import Foundation
import Charts

extension NSUIColor {
    
    convenience init(red: Int, green: Int, blue: Int){
        assert(red>=0&&red<=255, "Invalid Red Component")
        assert(green>=0&&green<=255, "Invalid Green Component")
        assert(blue>=0&&blue<=255, "Invalid Blue Component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(hex: Int){
        self.init(
            red:(hex >> 16) & 0xFF,
            green:(hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    
}
