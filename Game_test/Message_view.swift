//
//  ViewController.swift
//  Game_test
//
//  Created by Максим Чесников on 23.11.2019.
//  Copyright © 2019 Максим Чесников. All rights reserved.
//

import UIKit

class Message_View: UIViewController {


    
    @IBOutlet weak var Error: UILabel!
    @IBOutlet weak var Message: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Message.layer.cornerRadius = 24
        Error.text = "Не хватает денег"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel_message(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
 

}
