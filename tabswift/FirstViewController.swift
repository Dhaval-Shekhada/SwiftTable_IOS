//
//  FirstViewController.swift
//  tabswift
//
//  Created by Sarika D Shekhada on 15/12/16.
//  Copyright © 2016 sarika. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var tableitem: UITableView!
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
    
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        
        {
            items.remove(at: indexPath.row)
            
            tableView.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        let itemmain = UserDefaults.standard.object(forKey: "items")
        
        if let appitem = itemmain as? [String]
        {
            items = appitem
        }
        tableitem.reloadData()
    }
}

