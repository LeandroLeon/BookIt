//
//  Space.swift
//  BookIt
//
//  Created by Laura on 28/6/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

import ObjectMapper

class Field : Equatable, Mappable{
    
    var name: String?
    var sport: SportEnum?
    var pricePerHour: Double?
    var isRentable: Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map){
        name <- map["Field.name"]
        sport <- map["Field.sport"]
        pricePerHour <- map["Field.pricePerHour"]
        isRentable <- map["Field.isRentable"]
    }
    
    public static func ==(first: Field, second: Field) -> Bool{
        return
            first.name == second.name &&
            first.sport == second.sport &&
            first.pricePerHour == second.pricePerHour &&
            first.isRentable == second.isRentable
    }
}
