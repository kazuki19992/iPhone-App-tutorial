//
//  ViewController.swift
//  MyMusic
//
//  Created by 櫛田一樹 on 2020/08/15.
//  Copyright © 2020 kazuki19992. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // シンバル音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    // シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()

    // シンバルの音を鳴らすやつ
    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    
    
    // ギター音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    // ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()

    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    // BGMの設定
    let bgmPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    // BGM用のプレイヤーインスタンスを設定
    var bgmPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &bgmPlayer, path: bgmPath, count: -1)
    }
    @IBAction func stop(_ sender: Any) {
        // BGM停止
        bgmPlayer.stop()
    }
    
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int){
        do{
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        }catch{
            print("エラーが発生しました！")
        }
    }
}

