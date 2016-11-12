//
//  HomeModel.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/12/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    weak var delegate: HomeModelProtocol!
    var data: Data = Data()
    let urlPath: String = "http://tjmprojects.net/test.php"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: url)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.data.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print("Failed to download data")
        } else {
            print("Data downloaded")
            self.parseJSON()
        }
    }
    
    func parseJSON() {
        var jsonResult: Array<AnyObject>!
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: self.data, options: .allowFragments) as? Array
            
        } catch let error as NSError {
            print(error)
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let pets: NSMutableArray = NSMutableArray()
        
        for i in 0..<jsonResult.count {
            jsonElement = jsonResult[i] as! NSDictionary
            let pet = PetModel()
            
            // make sure none of the JSON elements are nil through optional binding
            
            let id = jsonElement["id"] as? Int
            let name = jsonElement["name"] as? String
            let petType = jsonElement["pet_type"] as? String
            let breed = jsonElement["breed"] as? String
            let sex = jsonElement["sex"] as? String
            let size = jsonElement["size"] as? Int
            let age = jsonElement["age"] as? Int
            let color = jsonElement["color"] as? String
            let imagePath = jsonElement["image_path"] as? String
            let info = jsonElement["info"] as? String

            pet.petID = id
            pet.name = name
            pet.petType = petType
            pet.breed = breed
            pet.sex = sex
            pet.size = size
            pet.color = color
            pet.age = age
            pet.imagePath = imagePath
            pet.info = info
            
            pets.add(pet)
            
        }
        
        DispatchQueue.main.async {
            self.delegate.itemsDownloaded(items: pets)
        }
        
    }
}
