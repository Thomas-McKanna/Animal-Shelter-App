//
//  SearchViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 10/31/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, SearchPickTableViewControllerDelegate {
    
    // Properties
    @IBOutlet weak var dogCatEitherLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var maleFemaleEitherLabel: UILabel!
    @IBOutlet weak var maxAgeLabel: UILabel!
    @IBOutlet weak var DogCatEitherSgmtCtrl: UISegmentedControl!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var maleFemaleEitherSgmtCtrl: UISegmentedControl!
    @IBOutlet weak var sizeOrHairLabel: UILabel!
    @IBOutlet weak var sizeOrHairTextField: UITextField!
    
    var inputDisabled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "breed" {
            let vc = segue.destination as! SearchPickTableViewController
            // if Dog is selected
            if DogCatEitherSgmtCtrl.selectedSegmentIndex == 0 {
                vc.listOfThings = DOG_BREEDS
                vc.title = "Select Breed"
                vc.delegateIdentifier = "breed"
                vc.delegate = self
            }
            // if Cat is selected
            else if DogCatEitherSgmtCtrl.selectedSegmentIndex == 1 {
                vc.listOfThings = CAT_BREEDS
                vc.delegateIdentifier = "breed"
                vc.delegate = self
            }
        }
        
        if segue.identifier == "age" {
            let vc = segue.destination as! SearchPickTableViewController
            vc.listOfThings = AGES
            vc.delegateIdentifier = "age"
            vc.delegate = self
        }
        
        if segue.identifier == "color" {
            let vc = segue.destination as! SearchPickTableViewController
            vc.listOfThings = COLORS
            vc.delegateIdentifier = "color"
            vc.delegate = self
        }
        
        if segue.identifier == "sizeOrHair" {
            let vc = segue.destination as! SearchPickTableViewController
            vc.delegateIdentifier = "sizeOrHair"
            vc.delegate = self
            // if "Dog is selected in the segment control
            if DogCatEitherSgmtCtrl.selectedSegmentIndex == 0 {
                vc.listOfThings = DOG_SIZES
            }
            // if "Cat" is selected in the segment control
            else if DogCatEitherSgmtCtrl.selectedSegmentIndex == 1 {
                vc.listOfThings = CAT_HAIR_STYLES
            }
        }
    }
    
    func finishedPicking(controller: SearchPickTableViewController, text: String, id: String) {
        if id == "breed" {
            breedTextField.text = text
        }
        
        if id == "age" {
           ageTextField.text = text
        }
        
        if id == "color" {
            colorTextField.text = text
        }
        
        if id == "sizeOrHair" {
            sizeOrHairTextField.text = text
        }
        
        controller.navigationController?.popViewController(animated: true)
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
    @IBAction func breedSegue(_ sender: UITextField) {
        performSegue(withIdentifier: "breed", sender: self)
    }
    @IBAction func ageSegue(_ sender: UITextField) {
        performSegue(withIdentifier: "age", sender: self)
    }
    @IBAction func colorSegue(_ sender: UITextField) {
        performSegue(withIdentifier: "color", sender: self)
    }
    @IBAction func sizeOrHairSegue(_ sender: UITextField) {
        performSegue(withIdentifier: "sizeOrHair", sender: self)
    }
    @IBAction func dogCatEitherChanged(_ sender: UISegmentedControl) {
        if DogCatEitherSgmtCtrl.selectedSegmentIndex == 0 {
            sizeOrHairLabel.text = "Size:"
            sizeOrHairTextField.text = ""
            sizeOrHairTextField.placeholder = "Any Size"
            if inputDisabled == true {
                toggleInput()
            }
        }
        else if DogCatEitherSgmtCtrl.selectedSegmentIndex == 1 {
            sizeOrHairLabel.text = "Hair:"
            sizeOrHairTextField.text = ""
            sizeOrHairTextField.placeholder = "Any Hair Type"
            if inputDisabled == true {
                toggleInput()
            }
        }
        else if DogCatEitherSgmtCtrl.selectedSegmentIndex == 2 {
            if inputDisabled == false {
                toggleInput()
            }
        }
    }
    
    func toggleInput() {
        if inputDisabled == false {
            // disable breed lbl and txtField
            breedLabel.isEnabled = false
            breedTextField.isEnabled = false
            // disable color lbl and txtField
            colorLabel.isEnabled = false
            colorTextField.isEnabled = false
            // disable sizeOrHair lbl and txtField
            sizeOrHairLabel.isEnabled = false
            sizeOrHairTextField.isEnabled = false
            // disable age lbl and txtField
            maxAgeLabel.isEnabled = false
            ageTextField.isEnabled = false
            
            inputDisabled = true
        }
        else if inputDisabled == true {
            // enable breed lbl and txtField
            breedLabel.isEnabled = true
            breedTextField.isEnabled = true
            // enable color lbl and txtField
            colorLabel.isEnabled = true
            colorTextField.isEnabled = true
            // enable sizeOrHair lbl and txtField
            sizeOrHairLabel.isEnabled = true
            sizeOrHairTextField.isEnabled = true
            // enable age lbl and txtField
            maxAgeLabel.isEnabled = true
            ageTextField.isEnabled = true
            
            inputDisabled = false
        }
    }
    
    
    
}
