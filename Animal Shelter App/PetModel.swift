//
//  PetModel.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/12/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

class PetModel: NSObject {
    
    // properties
    var petID: Int?
    var name: String?
    var petType: String?
    var breed: String?
    var sex: String?
    var size: String?
    var hair: String?
    var color: String?
    var age: String?
    var imagePath: String?
    var info: String?
    
    // empty constructor
    override init() {
        
    }
    
    // constructor
    init(petID: Int, name: String, petType: String, breed: String, sex: String, size: String, hair: String, color: String, age: String, imagePath: String, info: String) {
        self.petID = petID
        self.name = name
        self.petType = petType
        self.breed = breed
        self.sex = sex
        self.size = size
        self.hair = hair
        self.color = color
        self.age = age
        self.imagePath = imagePath
        self.info = info
    }
    
    // print objects current state
    override var description: String {
        return "ID: \(petID), Name: \(name), Type: \(petType), Breed: \(breed), Sex: \(sex), Size: \(size), Hair: \(hair), Color: \(color), Age: \(age),Path to Image: \(imagePath), Info: \(info),"
    }
}
