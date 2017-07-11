//
//  User.swift
//  BookIt
//
//  Created by Laura on 28/6/17.
//  Copyright © 2017 Leandro. All rights reserved.
//

class User{
    
    let name: String
    let lastname: String
    let id: String
    // Poner la pass en un gestor de contraseñas
    
    init(_ name: String, lastname: String, id: String){
        self.name = name
        self.lastname = lastname
        self.id = id
    }
}

