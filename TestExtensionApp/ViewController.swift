//
//  ViewController.swift
//  TestExtensionApp
//
//  Created by MichaelMou on 15/8/6.
//  Copyright (c) 2015年 MichaelMou. All rights reserved.
//

import UIKit

let token = "michael's token"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func login(sender: AnyObject) {
        let userDefault = NSUserDefaults(suiteName: GROUP_ID)!
        userDefault.setObject(token, forKey: "token")
        let succeed = userDefault.synchronize()
        println("succeed is \(succeed)")
    }
}

