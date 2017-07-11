//
//  Data.swift
//  BookIt
//
//  Created by Laura on 11/7/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

class Data {
    
    static var shareDate: Data = Data()
    var fields : [Field]
    
    private init(){
        return self.sharedDate
    }
    
    func getFields(of sport: SportEnum) -> Array<Field>{
        var result : Array<Field> = []
        for sport in self.fields{
            if sport.sport == sport{
                result.append(sport)
            }
        }
        return result
    }
    
    func addField(_ field: Field){
        self.fields += field
    }
    
    func removeField(_ field: Field) -> Field{
        for data in self.fields{
            if data == field{
                if let index = self.fields.index(of: data){
                    self.fields.remove(at: index)
                }
            }
        }
    }
}
