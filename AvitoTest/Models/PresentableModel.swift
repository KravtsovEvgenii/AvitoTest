//
//  PresentableModel.swift
//  AvitoTest
//
//  Created by User on 03.01.2021.
//

import Foundation
import UIKit

struct Header {
    var title: String
    var denyActionTitle: String
    var actionTitle: String
}

struct PresentableModel {
    var title: String
    var description: String?
    var price: String
    var isSelected: Bool
    var image: UIImage
    
    var intPrice: Int {
        var tempString = ""
        for char in self.price {
            if Int(String(char)) != nil{
                tempString += String(char)
            }else {
                return Int(tempString) ?? 0
            }
        }
        return Int(tempString) ?? 0
    }
}

