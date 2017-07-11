//
//  Sports.swift
//  BookIt
//
//  Created by Laura on 29/6/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

enum SportEnum {
    case futbol7, futbol11, futsal, basket, tenis, padel, piscina
    
    func getAllValues() -> [SportEnum] {
        return [.futbol7, .futbol11, .futsal, .basket, .tenis, .padel, .piscina]
    }
}


/*
 class Sport{
 
 let name: String
 var description: String?
 var pricePerHour: Double
 var image: String?
 let spaces: [Zone]
 static var amount: Int = 0
 
 init(name: String="Default", description: String? = nil, pricePerHour: Double=0, image: String? = "DefaultImage.png", spaces: [Zone]){
 
 self.name = name
 if let descriptionUnwrapped = description{
 self.description = descriptionUnwrapped
 }
 self.pricePerHour = pricePerHour
 if let imageUnwrapped = image{
 self.image = imageUnwrapped
 }
 self.spaces = spaces
 Sport.amount+=1
 }
 }
 */
