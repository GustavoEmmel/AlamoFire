//
//  ViewController.swift
//  alamofireExample
//
//  Created by Felipe Malta on 03/10/16.
//  Copyright © 2016 4tap. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        guard let path = Bundle.main.path(forResource: "carros", ofType: "json") else{return}
//        //let path = Bundle.main.path(forResource: "carros", ofType: "json")
//        
//        do{
//            let jsonString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
//            print(jsonString)
//            
//            do {
//                let json = try JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: []) as? Array<[String:AnyObject]>
//                
//                for obj in json!{
//                    print(obj["nome"])
//                    print(obj["cor"])
//                    print(obj["modelo"])
//                }
//            } catch let error as NSError {
//                print("Failed to load: \(error.localizedDescription)")
//            }
//            
//        }catch  let error as NSError {
//             print("Failed to load: \(error.localizedDescription)")
//        }
//        
        
        
        Alamofire.request("http://localhost/carros.json")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/plain"])
            .responseJSON { response in
                switch response.result {
                case .success:
    
                      do {
                        let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? Array<[String:AnyObject]>
                       
                        for obj in json!{
                            print(obj["nome"])
                            print(obj["cor"])
                            print(obj["modelo"])

                        }


                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                
                case .failure(let error):
                    print("Deu errado\(error)")
                
                }
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
