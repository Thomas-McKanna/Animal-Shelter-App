//
//  HomeModel.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/12/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

// this function is implemented in ResultsTableViewController, allowing the list of pet profiles to be sent their
protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    weak var delegate: HomeModelProtocol!
    var data: Data = Data()
    // this path will have to be added to (query string) in order for the app to be fully implemented
    let urlPath: String = "http://tjmprojects.net/test.php"
    
    // starts a web session and go to the specified URL
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: url)
        task.resume()
    }
    
    // as data comes in, this function is called
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data)
    }
    
    // once all data has been transferred this function is called
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print("Failed to download data")
        } else {
            print("Data downloaded")
            // the data is returned in the form of JSON, so we must tranlate the information into a Swift array
            self.parseJSON()
        }
    }
    
    // parses the JSON (JavaScript Object Notation)
    func parseJSON() {
        var jsonResult: Array<AnyObject>!
        
        // this statement does the parsing
        do {
            jsonResult = try JSONSerialization.jsonObject(with: self.data, options: .allowFragments) as? Array
            
        } catch let error as NSError {
            print(error)
        }
        
        // the results of the parse are to be stored in these variables
        var jsonElement: NSDictionary = NSDictionary()
        let pets: NSMutableArray = NSMutableArray()
        
        for i in 0..<jsonResult.count {
            // a Dictionary maps keys to values, such as ["id"] => 1
            jsonElement = jsonResult[i] as! NSDictionary
            // every iteration, we make a PetModel, which will be added to an array and sent to the table view
            let pet = PetModel()
            
            // I was only able to get the JSON items to be converted to strings; integer conversion is done later on
            guard let id = jsonElement["id"] as? String,
                let name = jsonElement["name"] as? String,
                let petType = jsonElement["pet_type"] as? String,
                let breed = jsonElement["breed"] as? String,
                let sex = jsonElement["sex"] as? String,
                let size = jsonElement["size"] as? String,
                let age = jsonElement["age"] as? String,
                let color = jsonElement["color"] as? String,
                let imagePath = jsonElement["image_path"] as? String,
                let info = jsonElement["info"] as? String else {
                print("JSON contained invalid data")
                return
            }
            
            // pet object fields are filled in; conversions to Integer happen where appropriate
            pet.petID = Int(id)
            pet.name = name
            pet.petType = petType
            pet.breed = breed
            pet.sex = sex
            pet.size = Int(size)
            pet.color = color
            pet.age = Int(age)
            pet.imagePath = imagePath
            pet.info = info
            
            // pet is added to array
            pets.add(pet)
        }
        
        // sends the pet profiles to the ResultsTableViewController
        DispatchQueue.main.async {
            self.delegate.itemsDownloaded(items: pets)
        }
        
    }
}
