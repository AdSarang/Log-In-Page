//
//  ViewController.swift
//  Log In Module Basic
//
//  Created by Advait on 27/06/17.
//  Copyright © 2017 Advait. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

   
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var mytext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let results = try context.fetch(request)
                for result in results as! [NSManagedObject]{
      
                    if let username = result.value(forKey: "name")as? String{
                        mytext.alpha = 0
                       logInButton.alpha = 0
                        mylabel.text = "Hello "+username+"!"
                    }
                
                }
            }
        catch{
            print("Failed to fetch data")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    @IBAction func logInButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newValue.setValue(mytext.text!, forKey: "name")
        do{
            try context.save()
            mytext.alpha = 0
            logInButton.alpha = 0
            mylabel.text = "Hello "+mytext.text!+"!"
        }
        catch{
            print("Failed to save data")
        }

  

    }
}
