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
    // handle on navigation item, to change name
    @IBOutlet weak var navItem: UINavigationItem!
    
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
        
        // set image resolution
        imgPhoto.contentMode = .scaleAspectFit
        
        // set image
        let urlString = "http://tjmprojects.net/animal-shelter/img/pet" + String(describing: pet.petID!) + ".jpg"
        let downloadURL = NSURL(string: urlString)!
        imgPhoto.af_setImage(withURL: downloadURL as URL)
        
        loadHeart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // need to reload heart incase user just changed it from the "favorites" tab
        loadHeart()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageView = segue.destination as! MessageViewController
        messageView.pet = self.pet
    }
    
    // actions
    @IBAction func btnFavorite(_ sender: UIButton) {
        if btnFavoriteImage.image(for: .normal) == #imageLiteral(resourceName: "Empty Heart") {
            // toggle the heart on
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Filled Heart"), for: .normal)
            
            // save the pet in favorites
            savePet()
        }
        else if btnFavoriteImage.image(for: .normal) == #imageLiteral(resourceName: "Filled Heart") {
            // toggle the herat off
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Empty Heart"), for: .normal)
            
            // delete the pet in fovorites
            deletePet()
        }
        else {
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Empty Heart"), for: .normal)
        }
    }
    @IBAction func btnAsk(_ sender: UIButton) {
        performSegue(withIdentifier: "message", sender: self)
    }
    
    // loads data from Pet CoreData model, and searches through to see if the petID for this pet is the same as any of the "favorited" pet's IDs. If so, the "favorite" heart is filled in; else, it is not
    func loadHeart() {
        var pets: [Pet] = []
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            pets = try context.fetch(Pet.fetchRequest())
        }
        catch {
            print("loadHeart(): fetch request failed")
        }
        
        var isFound: Bool = false
        for pet in pets {
            if pet.pet_id == Int32(self.pet.petID!) {
                isFound = true
            }
        }
        
        if isFound == true {
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Filled Heart"), for: .normal)
        }
        else {
            btnFavoriteImage.setImage(#imageLiteral(resourceName: "Empty Heart"), for: .normal)
        }
    }
    
    func savePet() {
        // create the context of our data model so that we can alter it
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // make a new favorite pet entity
        let newFavPet = Pet(context: context)
        newFavPet.pet_id = Int32(pet.petID!)
        newFavPet.pet_type = pet.petType
        newFavPet.name = pet.name
        newFavPet.sex = pet.sex
        newFavPet.breed = pet.breed
        newFavPet.age = pet.age
        newFavPet.size = pet.size
        newFavPet.hair = pet.hair
        newFavPet.info = pet.info
        newFavPet.color = pet.color
        newFavPet.path_to_image = pet.imagePath
        
        // save the new favorite pet
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func deletePet() {
        var pets: [Pet] = []
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            pets = try context.fetch(Pet.fetchRequest())
        }
        catch {
            print("deletePet(): fetch request failed")
        }
        
        for pet in pets {
            if pet.pet_id == Int32(self.pet.petID!) {
                context.delete(pet)
            }
        }
        
        // save the context NOT WORKING
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
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
