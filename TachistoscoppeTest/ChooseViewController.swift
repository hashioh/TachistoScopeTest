//
//  ChooseViewController.swift
//  TachistoscoppeTest
//
//  Created by Kazuki Ohashi on 2016/09/30.
//  Copyright © 2016年 Kazuki Ohashi. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
    
    // どの単語帳を選んだかわかるように、変数を作る
    var num: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        num = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        num = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 単語帳のボタンを押した時の処理
    @IBAction func choiceButton(sender: UIButton) {
        
        // sender.tag は 英語初級編が1, 中級編が2, 上級編が3 ってなってる
        // num はもともと0だから、そこにsender.tag の数値を足して、num という変数で
        // どのボタンが選ばれたか判別するようにしている
        num = num + sender.tag
        
        // すぐ下の "func performSegueToShowVC()" というメソッドをここで呼んでいる
        performSegueToShowVC()
    }
    
    // 画面遷移するためのメソッド
    func performSegueToShowVC() {
        
        // toShow という名前のSegueを使って画面遷移をする
        performSegueWithIdentifier("toShowVC", sender: nil)
    }
    
    
    // Segueで画面遷移をするときにnumという変数の値を次の画面（ShowViewController）に受け渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // ここで値を受け渡す処理をしている
        let showViewController = segue.destinationViewController as! ShowViewController
        // 変数numの値を「ShowViewController」のgetNumberに受け渡しする
        showViewController.getNumber = self.num
        
    }
    
   }
