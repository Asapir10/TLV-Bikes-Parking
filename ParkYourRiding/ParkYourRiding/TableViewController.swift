//
//  TableViewController.swift
//  ParkYourRiding
//
//  Created by USER on 11/10/2018.
//  Copyright © 2018 USER. All rights reserved.
//

import UIKit



class TableViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableArray = [String] ()
    
    @IBOutlet var tableView: UITableView!;

    //@IBOutlet weak var locationsTable: UITableView!
    
    override func viewDidLoad() {
        
        parseJSON()
    }
    
     func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = self.tableArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func parseJSON(){

            let url = URL(string: "https://api.myjson.com/bins/vi56v")

            let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in

                guard error == nil else{
                    print("returning error")
                    return
                }

                if error != nil{

                }else{
                    print("returned error")
                }

                guard let content = data else{
                    print("not returning data")
                    return
                }

                guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else{
                    print("not containing json")
                    return
                }
                if let array = json["companies"] as? [String] {
                    self.tableArray = array
                }

                print(self.tableArray)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }

       task.resume()

    }







    
     
}

