//
//  MessageViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/15/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit
import Alamofire

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
        sendMail()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // sends an email using the Alamofire API
    // TODO: error checking - make sure user has entered values into the fields (possibly get an API to make sure email is valid?)
    // TODO: add html message functionality
    func sendMail() {
        let key = "key-e370afda5362b7dfcb5023281c7f0db2"
        let emailTo = "tmckanna1@live.maryville.edu"
        
        let parameters = [
            "from": "message@tjmprojects.net",
            "to": "\(emailTo)",
            "subject": "Message about \(pet.name!)",
            "text": "This message was generated from the Animal Shelter iOS App:\r\nEmail Address: \(txtfieldEmail.text!)\r\nName: \(txtfieldFirstName.text) \(txtfieldLastName.text!)\r\n\r\nMessage:\r\n\(txtboxMessage.text!)"
        ]
        
        Alamofire.request("https://api.mailgun.net/v3/mail.tjmprojects.net/messages", method: .post, parameters:parameters)
            .authenticate(user: "api", password: key)
            .response { response in
                debugPrint(response)
                print(response.response?.statusCode)
            }
    }


}

