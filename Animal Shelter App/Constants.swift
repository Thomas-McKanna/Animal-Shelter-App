//
//  Constants.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/4/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

// TODO: make complete list (http://www.adoptapet.com/adoption_rescue/74766.html)

let CAT_COLORS = ["Black", "Black & White or Tuxedo", "Brown or Chocolate", "Brown Tabby", "Calico or Dilute Calico", "Cream or Ivory", "Gray, Blue, or Silver Tabby", "Gray or Blue", "Orange or Red", "Orange or Red Tabby", "Spotted Tabby/Leopard Spotted", "Tabby", "Tan or Fawn", "Tan or Fawn Tabby", "Tiger Stripped", "Tortoiseshell", "White"]

// TODO: make complete list (http://www.adoptapet.com/adoption_rescue/74766.html)
let DOG_COLORS = ["Black", "Brindle", "Brown/Chocolate", "Gray/Blue/Silver/Salt & Pepper", "Merle", "Red/Golden/Orange/Chestnut", "Silver & Tan", "Tan/Yellow/Fawn", "Tricolor", "White"]

let CAT_AGES = ["Any Age", "Young", "Adult", "Senior", "Kitten"]

let DOG_AGES = ["Any Age", "Young", "Adult", "Senior", "Puppy"]

let CAT_HAIR_STYLES = ["Short", "Medium", "Long"]

let DOG_SIZES = ["Small (25 lb or less)", "Med. (26-60 lb)", "Large (61-100 lb)", "X-Large (101 lb or more)"]

// stores ["breed_name"] => "breed_id"
var BREED_TO_ID: Dictionary = Dictionary<String, String>()

// inverse of BREED_TO_ID - index number represents the breed_id
var ID_TO_BREED: [String] = Array<String>()

// TODO: add "Any Breed" funcationality
var CAT_BREEDS: [String] = Array<String>()

// TODO: add "Any Breed" funcationality
var DOG_BREEDS: [String] = Array<String>()

// given a breed name, returns the breed_id
func breedToID(breed: String) -> String {
    return BREED_TO_ID["\(breed)"]!
}

// given a breed id, returns the breed_name
func idToBreed(id: String) -> String {
    return ID_TO_BREED[Int(id)!]
}

// given a string "M" or "F", returns "Male" or "Female", respectively
func toSex(sex: String) -> String {
    if sex == "M" {
        return "Male"
    }
    else if sex  == "F" {
        return "Female"
    }
    
    return "Error in toSex()"
}


