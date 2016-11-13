//
//  SearchModel.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/13/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

class SearchModel: NSObject {
    
    // properties
    var petType: String?
    var sex: String?
    var breed: String?
    var color: String?
    var age: String?
    // either hair type (cat) or size (dog)
    var petSpecificAttribute: String?
    
    // empty constructor
    override init() {
        
    }
    
    // constructor
    init(petType: String, sex: String, breed: String, color: String, age: String, petSpecificAttribute: String) {
        self.petType = petType
        self.sex = sex
        self.breed = breed
        self.color = color
        self.age = age
        self.petSpecificAttribute = petSpecificAttribute
    }
    
    // print objects current state
    override var description: String {
        return "Pet Type: \(petType), Sex: \(sex), Breed: \(breed), Color: \(color), Age: \(age), Pet-Specific Attribute: \(petSpecificAttribute)"
    }
}

