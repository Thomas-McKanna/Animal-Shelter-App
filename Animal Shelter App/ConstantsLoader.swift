//
//  ConstantsLoader.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/13/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import Foundation

class ConstantsLoader: NSObject, URLSessionDataDelegate {

    var data: Data = Data()
    // TODO: php file still needs to be fully implemented (other database tables similar to breed?)
    var urlPath: String = "http://tjmprojects.net/animal-shelter/breeds.php"
    
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
        
        DOG_BREEDS.append("Any Breed")
        CAT_BREEDS.append("Any Breed")
        
        if jsonResult != nil {
            for i in 0..<jsonResult.count {
                // a Dictionary maps keys to values, such as ["id"] => 1
                jsonElement = jsonResult[i] as! NSDictionary
                
                BREED_TO_ID[(jsonElement["breed_name"] as? String)!] = jsonElement["breed_id"] as? String
            
                ID_TO_BREED.append((jsonElement["breed_name"] as? String)!)
            
                if jsonElement["pet_type"] as? String == "D" {
                    DOG_BREEDS.append(jsonElement["breed_name"] as! String)
                }
                else if jsonElement["pet_type"] as? String == "C" {
                    CAT_BREEDS.append(jsonElement["breed_name"] as! String)
                }
            }
        }
    }
}
