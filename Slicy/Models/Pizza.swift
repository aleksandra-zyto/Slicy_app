//
//  Pizza.swift
//  Slicy
//
//  Created by Ola Żyto on 25/08/2023.
//

import Foundation
import SwiftUI

struct Pizza {
    
    var name: String
    var size: String
    var price: String
    
    func calculateResult(pizza : Pizza) -> FinalResult {
        let radius = (Double(pizza.size) ?? 0) / 2
        let area = Double.pi * pow(radius, 2)
        let result = (Double(pizza.price) ?? 0)/area
        return FinalResult(name: pizza.name, pricePerUnit: result)
    }
    
}
