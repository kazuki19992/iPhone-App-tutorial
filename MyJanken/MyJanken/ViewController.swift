//
//  ViewController.swift
//  MyJanken
//
//  Created by 櫛田一樹 on 2020/08/15.
//  Copyright © 2020 kazuki19992. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var AnsImgView: UIImageView!
    
    
    @IBOutlet weak var AnsLabel: UILabel!
    
//    じゃんけん(数字)
//    グー:0
//    チョキ:1
//    パー:2
    var result = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
        
//        新しい結果を格納しておく
        var newResult = 0
        
//        ランダムに結果を出すが、前回と異なる場合のみ採用
        repeat{
            newResult = Int.random(in: 0..<3)
            
//            前回の結果と同じならば乱数を振り直す
        }while(newResult == result)
        
        result = newResult
        
        if(result == 0){
            AnsLabel.text = "グー"
            AnsImgView.image = UIImage(named: "gu")
        }else if(result == 1){
            AnsLabel.text = "チョキ"
            AnsImgView.image = UIImage(named:"choki")
        }else if(result == 2){
            AnsLabel.text = "パー"
            AnsImgView.image = UIImage(named: "pa")
        }
        
    }
    
    
}

