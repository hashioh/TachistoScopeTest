//
//  ShowViewController.swift
//  TachistoscoppeTest
//
//  Created by Kazuki Ohashi on 2016/09/30.
//  Copyright © 2016年 Kazuki Ohashi. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    // ボタンの文字を変えたいのでここで宣言
    @IBOutlet var button: UIButton!
    
    // 表示するようのラベル
    @IBOutlet var  showLabel: UILabel!
    
    // 配列の中身をこれげ移動する
    var index: Int = 0
    
    // タイマーを使う
    var timer : NSTimer = NSTimer()
    
    // 単語帳の中身の配列
    // ここに好きな単語を入れておく
    let showArray1: [String] = ["て", "", "す", "", "と", ""]
    let showArray2: [String] = ["テ", "", "ス", "", "ト", ""]
    let showArray3: [String] = ["t", "", "e", "", "s", "", "t", "", "!", ""]
    
    
    // ChooseViewControllerのnumの値を受け取る変数
    var getNumber: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func start(){
        
        // もしタイマーが動いていたら
        if timer.valid {
            
            // タイマーを止める
            timer.invalidate()
            // ボタンのタイトルを「スタート」に変える
            button.setTitle("スタート", forState: UIControlState.Normal)
            // showLabelのテキストを「スタートを押してね」に変える（\nは改行を表す）
            showLabel.text = "スタートを\n押してね"
            
            
            // もしタイマーが動いていなかったら
        } else {
            
            // タイマーの設定
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(self.countUp), userInfo: nil, repeats: true)
            // ボタンのタイトルを「ストップ」に変える
            button.setTitle("ストップ", forState: UIControlState.Normal)
        }
        
    }
    
    // タイマーによって呼ばれるメソッド
    func countUp () {
        
        // 単語初級編が選ばれたら
        if getNumber == 1 {
            print(index)
            showLabel.text = showArray1[index]
            //indexの値を+1する
            index = index + 1
            
            //indexの値が配列の中身の数より大きくなったら
            
            if index > showArray1.count - 1 {
                
                index = 0
            }
            
            // 中級編が選ばれたら
        } else if getNumber == 2 {
            showLabel.text = showArray2[index]
            
            //indexの値を+1する
            index = index + 1
            
            //indexの値が配列の中身の数より大きくなったら
            
            if index > showArray2.count - 1 {
                
                index = 0
            }
            
            // 上級編が選ばれたら
        } else if getNumber == 3 {
            showLabel.text = showArray3[index]
            
            //indexの値を+1する
            index = index + 1
            
            //indexの値が配列の中身の数より大きくなったら
            
            if index > showArray3.count - 1 {
                
                index = 0
            }
            
        }
        
    }
    
    // 画面遷移する直前に呼ばれる
    override func viewWillDisappear(animated: Bool) {
        // 前の画面に戻る時にgetNumberを0にしておく
        getNumber = 0
    }
    
    
    
}
