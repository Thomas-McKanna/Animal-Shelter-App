//
//  ResultsTableViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/12/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController, HomeModelProtocol {

    // properties
    var feedItems: NSArray = NSArray()
    var selectedPet: PetModel?
    // to be assigned before segue
    var searchModel: SearchModel?
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        listTableView.rowHeight = 90
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.urlPath += determineQueryString()
        homeModel.downloadItems()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // this function must be implemented as part of the HomeModelProtocol
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.listTableView.reloadData()
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
        return feedItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "PetTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PetTableViewCell

        // Configure the cell...
        let item: PetModel = feedItems[indexPath.row] as! PetModel
        cell.lblName.text = item.name
        cell.lblSex.text = item.sex
        cell.lblBreed.text = item.breed
        
        // TODO: picture needs to be added somehow
        
        
        return cell
    }
    
    
    // when a pet is selected, set that pet as the selectedPet and initiate a segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPet = feedItems[indexPath.row] as? PetModel
        performSegue(withIdentifier: "petSegue", sender: self)
    }
 
 
    
    // before a segue takes place, the pet profile that will be used to build the view is set
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "petSegue" {
            let petProfile = segue.destination as! ProfileViewController
            petProfile.pet = self.selectedPet!
            petProfile.navItem.title = self.selectedPet?.name
        }
    }
 
    
    func determineQueryString() -> String {
        
        // TODO: determine if certain fields need to be condensed to be matched with database entries
        
        var queryString: String = "?"
        var queryAdded: Bool = false
        
        // check if sex is specified
        if searchModel!.sex != nil {
            queryString += "sex=\(searchModel!.sex!)"
            queryAdded = true
        }
        
        // check if pet type is specified
        
        if searchModel!.petType != nil {
            // will add '&' to query string if necessary
            queryString += addAmpersand(queryAdded: queryAdded)
            queryString += "pet_type=\(searchModel!.petType!)"
            queryAdded = true
            
            // TODO: string value of breed must be converted into an integet value
            // check if there is a breed specified
            if searchModel!.breed != nil {
                queryString += addAmpersand(queryAdded: queryAdded)
                queryString += "breed_id=\(searchModel!.breed!)"
                queryAdded = true
            }
            
            // check if there is a color specified
            if searchModel!.color != nil {
                queryString += addAmpersand(queryAdded: queryAdded)
                queryString += "color=\(searchModel!.color!)"
                queryAdded = true
            }
            
            // check if there is an age specified
            if searchModel!.age != nil {
                queryString += addAmpersand(queryAdded: queryAdded)
                queryString += "age=\(searchModel!.age!)"
                queryAdded = true
            }
            
            // check if there is an pet-specific attribute specified
            if searchModel!.petSpecificAttribute != nil {
                if searchModel!.petType == "D" {
                    queryString += addAmpersand(queryAdded: queryAdded)
                    queryString += "size=\(searchModel!.petSpecificAttribute!)"
                }
                else if searchModel!.petType == "C" {
                    queryString += addAmpersand(queryAdded: queryAdded)
                    queryString += "hair=\(searchModel!.petSpecificAttribute!)"
                }
            }
        }
        else {
            // do nothing - the query string is ready to be returned
        }
        
        if queryString != "?" {
            return queryString
        }
        else {
            // the user wants to see all pets in the database; no need for a query string
            return ""
        }
    }
    
    func addAmpersand(queryAdded: Bool) -> String {
        if queryAdded == true {
            return "&"
        }
        else {
            return ""
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
