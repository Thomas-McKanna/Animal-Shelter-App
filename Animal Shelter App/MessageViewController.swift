//
//  MessageViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/15/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    // properties
    var pet = PetModel()
    
    @IBOutlet weak var lblMsgAbout: UILabel!
    @IBOutlet weak var txtfieldFirstName: UITextField!
    @IBOutlet weak var txtfieldLastName: UITextField!
    @IBOutlet weak var txtfieldEmail: UITextField!
    @IBOutlet weak var txtboxMessage: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMsgAbout.text = "Send us a message about \(pet.name!):"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // actions
    @IBAction func btnSend(_ sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
