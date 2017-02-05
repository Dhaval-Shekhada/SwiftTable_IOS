//
//  SecondViewController.swift
//  tabswift
//
//  Created by Sarika D Shekhada on 15/12/16.
//  Copyright © 2016 sarika. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextViewDelegate {

    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func addItem(_ sender: Any)
    {
        let itemsobject = UserDefaults.standard.object(forKey: "items")
        
        var items : [String]
        
        if let itemfatch = itemsobject as? [String]
        {
            items = itemfatch
            items.append(itemTextField.text!)
            
        }
        else
        {
            items = [itemTextField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
}

