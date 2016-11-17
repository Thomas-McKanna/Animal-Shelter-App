//
//  FavoritesTableViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/16/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    // properties
    // array of pets to be displayed
    var pets: [PetModel] = []
    // the pet which has been selected (used for segues)
    var selectedPet = PetModel()
    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        // set height to 90
        listTableView.rowHeight = 90
        
        loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        listTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "favorite"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FavoritesTableViewCell

        // Configure the cell...
        cell.lblName.text = pets[indexPath.row].name!
        cell.lblSex.text = pets[indexPath.row].sex!
        cell.lblBreed.text = pets[indexPath.row].breed!
        
        // TODO: set the picture (will require request to database)

        return cell
    }
 
    func loadData() {
        self.pets.removeAll()
        var pets: [Pet] = []
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            pets = try context.fetch(Pet.fetchRequest())
        }
        catch {
            print("loadData(): fetch request failed")
        }
        
        var tempPet: PetModel
        // fill in the PetModel array
        for pet in pets {
            
            tempPet = PetModel()
            
            tempPet.petID = Int(pet.pet_id)
            tempPet.petType = pet.pet_type
            tempPet.sex = pet.sex
            tempPet.breed = pet.breed
            tempPet.age = pet.age
            tempPet.size = pet.size
            tempPet.name = pet.name
            tempPet.hair = pet.hair
            tempPet.info = pet.info
            tempPet.color = pet.color
            tempPet.imagePath = pet.path_to_image
            
            self.pets.append(tempPet)
        }
    }
    
    // when a pet is selected, set that pet as the selectedPet and initiate a segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPet = pets[indexPath.row] 
        performSegue(withIdentifier: "favorite", sender: self)
    }
    
    
    
    // before a segue takes place, the pet profile that will be used to build the view is set
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favorite" {
            let petProfile = segue.destination as! ProfileViewController
            petProfile.pet = self.selectedPet
            petProfile.navItem.title = self.selectedPet.name
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
