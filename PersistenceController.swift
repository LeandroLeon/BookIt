//
//  PersistenceController.swift
//  BookIt
//
//  Created by Laura on 11/7/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PersistenceController{
    
    var data = Data.shareData
    
    func initializeData(){
        Alamofire.request("https://cl.ly/0r0x1r2v1y3x/download/fields.json").responseObject { (response: DataResponse<Field>) in

            let response = response.result.value
            print(response)
            if let responseUnwrapped = response {
                print(responseUnwrapped.name)
            } else {
                print("No está saliendo")
            }
        }
    }
}


