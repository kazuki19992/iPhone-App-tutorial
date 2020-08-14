//
//  ViewController.swift
//  MyFirst
//
//  Created by 櫛田一樹 on 2020/08/14.
//  Copyright © 2020 kazuki19992. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // (1)ラベルに文字を入れる
        outputLabel.text = "Hello_Swift!"
    }


    @IBOutlet weak var outputLabel: UILabel!
}

