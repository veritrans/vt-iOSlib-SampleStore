//
//  VTItem.swift
//  VTSampleStoreiOS
//
//  Created by Muhammad Anis on 12/29/14.
//  Copyright (c) 2014 Veritrans Indonesia. All rights reserved.
//

import Foundation




func ==(lhs: VTItem, rhs: VTItem) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class VTItem : Hashable{
    
    var id : Int
    var imageName : String
    var name : String
    var price : Int
    
    init(id: Int, imageName: String, name: String, price: Int){
        self.id = id
        self.imageName = imageName
        self.name = name
        self.price = price
    }
    
    var hashValue : Int{
        get{
            return self.id
        }
    }
    
}
