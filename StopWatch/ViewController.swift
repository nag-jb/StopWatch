//
//  ViewController.swift
//  StopWatch
//
//  Created by Sallivan James on 2021/02/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var perfect: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        perfect.isHidden = true
    }
    
    @objc func up(){
//        countを0.01足す
        count = count + 0.01
//        ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid{
//            タイマーが動作していなかったら作動
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up),userInfo: nil,repeats: true)
        }
        perfect.isHidden = true
    }
    
    @IBAction func stop(){
        if timer.isValid{
//            タイマーが動作していたら停止する
            timer.invalidate()
//            hanteiメソッドを呼び出し結果を表示
             self.hantei()
        }
    }
    
    @IBAction func reset(){
//        タイマーが動作していたら停止させ0にする
        if timer.isValid{
            timer.invalidate()
            
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
        perfect.isHidden = true
    }
    
    @IBAction func hantei(){
        if count >= 9.80 && count <= 10.20{
            perfect.isHidden = false
        }else{
            perfect.isHidden = true
        }
    }
    


}

