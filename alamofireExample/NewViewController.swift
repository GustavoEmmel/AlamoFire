//
//  NewViewController.swift
//  alamofireExample
//
//  Created by Aluno on 05/12/16.
//  Copyright © 2016 4tap. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bookList = [ImageBook]()
    
    @IBOutlet weak var tableBook: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        Alamofire.request("https://jsonplaceholder.typicode.com/photos")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success:
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? Array<[String:AnyObject]>
                        
             
                        for obj in json!{
              
                            let book = ImageBook()
                            
                            
                            if let id = obj["id"] as? Int {
                                book.id = id
                            }
                            
                            
                            if let title = obj["title"] as? String {
                                book.title = title
                            }

                            if let imgURL = obj["imgURL"] as? String {
                                book.imgURL = imgURL
                            }

                            if let imgThumbnailUrl = obj["imgThumbnailUrl"] as? String {
                                book.imgThumbnailUrl = imgThumbnailUrl
                                print(imgThumbnailUrl)

                            }

    
                            
                            self.bookList.append(book)
                            
                        }
                        
                      self.tableBook.reloadData()
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                    
                case .failure(let error):
                    print("Deu errado\(error)")
                    
                }
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "celteste", for: indexPath) as! TableViewCell
        
        
        
        cell.myLabel.text = self.bookList[indexPath.row].title
        
        if(self.bookList[indexPath.row].imgThumbnailUrl != nil){
            cell.myImage.sd_setImage(with: URL(string: self.bookList[indexPath.row].imgThumbnailUrl))
        }

        
        return cell
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
