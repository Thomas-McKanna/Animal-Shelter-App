//
//  SearchViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 10/31/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var dogCatEitherLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var maleFemaleEitherLabel: UILabel!
    @IBOutlet weak var maxAgeLabel: UILabel!
    @IBOutlet weak var specialNeedsLabel: UILabel!
    @IBOutlet weak var DogCatEitherSgmtCtrl: UISegmentedControl!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var maleFemaleEitherSgmtCtrl: UISegmentedControl!
    @IBOutlet weak var specialNeedsSwitch: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions
    @IBAction func searchButton(_ sender: UIButton) {
        // encapsulate the user's choice into an object
        // send that object to the Search Results view, where its information will be used to query the database of available pets
    }
    
}
