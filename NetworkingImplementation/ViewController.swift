//
//  ViewController.swift
//  NetworkingImplementation
//
//  Created by Rocko Nájera on 4/9/17.
//  Copyright © 2017 Rocko Nájera. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SwiftyRequest(url: "http://swapi.co/api/films/1/") { networkResponse in
            
            debugPrint(networkResponse)
            
            if let MovieDirector = networkResponse["director"].string{
                print("Movie Director -> \(MovieDirector)")
            }
            
            
            }
        }

    


    func SwiftyRequest(url:String, completion: @escaping (_ completion : JSON) -> Void){

        Alamofire.request(url).responseJSON { response in

            print(response.result)   // result of response serialization

            let swiftyJsonVar = JSON(response.result.value!)
            
            completion(swiftyJsonVar)
            
        }
    }
}

