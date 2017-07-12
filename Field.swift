//
//  Space.swift
//  BookIt
//
//  Created by Laura on 28/6/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

import Foundation

class Field{
    
    var name: String
    let sport: SportEnum
    let pricePerHour: Double
    var isRentable: Bool
    
    
    init(_ name: String, sport: SportEnum, pricePerHour: Double){
        self.name = name
        self.sport = sport
        self.pricePerHour = pricePerHour
        self.isRentable = true
    }
}
