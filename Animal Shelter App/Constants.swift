//
//  Constants.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/4/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

// TODO: make complete list (http://www.adoptapet.com/adoption_rescue/74766.html)
let CAT_COLORS = ["Any Color", "Black", "White"]

// TODO: make complete list (http://www.adoptapet.com/adoption_rescue/74766.html)
let DOG_COLORS = ["Any Color", "Black", "White"]

let CAT_AGES = ["Any Age", "Young", "Adult", "Senior", "Kitten"]

let DOG_AGES = ["Any Age", "Young", "Adult", "Senior", "Puppy"]

let CAT_HAIR_STYLES = ["Short", "Medium", "Long"]

let DOG_SIZES = ["Small (25 lb or less)", "Med. (26-60 lb)", "Large (61-100 lb)", "X-Large (101 lb or more)"]

// stores ["breed_name"] => "breed_id"
var BREED_TO_ID: Dictionary = Dictionary<String, String>()

// TODO: add "Any Breed" funcationality
var CAT_BREEDS: [String] = Array<String>()

// TODO: add "Any Breed" funcationality
var DOG_BREEDS: [String] = Array<String>()


