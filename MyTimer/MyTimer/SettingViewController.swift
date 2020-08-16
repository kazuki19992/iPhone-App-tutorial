//
//  SettingViewController.swift
//  MyTimer
//
//  Created by 櫛田一樹 on 2020/08/16.
//  Copyright © 2020 kazuki19992. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // UIPickerViewに表示するデータをArrayで作成
    let settingsArray : [Int] = [10, 20, 30, 40, 50, 60]
    
    // 設定値を覚えるキーを設定
    let settingsKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // timerSettingPickerのデリゲートとデータソースの通知先を指定
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        // UserDefaultの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingsKey)
        
        // Pickerの選択を合わせる
        for row in 0 ..< settingsArray.count {
            if(settingsArray[row] == timerValue){
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: Any) {
        // 前画面へ戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    // UIPickerViewの列数を設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数を取得
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingsArray.count
    }
    
    // UIPickerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingsArray[row])
    }
    
    // Picker選択時に実行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // UserDefaultsの設定
        let settings = UserDefaults.standard
        settings.setValue(settingsArray[row], forKey: settingsKey)
        settings.synchronize()
    }
    
}
