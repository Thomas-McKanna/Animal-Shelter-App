//
//  ProfileViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/12/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // TODO: Fill in information using the variable pet
    
    // properties
    var pet = PetModel()
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBreed: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblPetSpecific: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var btnFavoriteImage: UIButton!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    @IBOutlet weak var lblPetSpecificField: UILabel!
    @IBOutlet weak var txtboxAddInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // do pet specific work first (hair or size)
        if pet.petType == "D" {
            lblPetSpecificField.text = "Size"
            lblPetSpecific.text = pet.size
        }
        else if pet.petType == "C" {
            lblPetSpecificField.text = "Hair"
            lblPetSpecific.text = pet.hair
        }
        lblName.text = pet.name
        lblBreed.text = pet.breed
        lblSex.text = pet.sex
        lblColor.text = pet.color
        lblAge.text = pet.age
        lblID.text = String(describing: pet.petID!)
        txtboxAddInfo.text = pet.info
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageView = segue.destination as! MessageViewController
        messageView.pet = self.pet
    }
    
    // actions
    @IBAction func btnFavorite(_ sender: UIButton) {
        if btnFavoriteImage.image(for: .normal) == #imageLiteral(resourceName: "Empty Heart") {
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Filled Heart"), for: .normal)
        }
        else if btnFavoriteImage.image(for: .normal) == #imageLiteral(resourceName: "Filled Heart") {
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Empty Heart"), for: .normal)
        }
        else {
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Empty Heart"), for: .normal)
        }
    }
    @IBAction func btnAsk(_ sender: UIButton) {
        performSegue(withIdentifier: "message", sender: self)
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
