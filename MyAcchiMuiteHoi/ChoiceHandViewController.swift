//
//  ChoiceHandViewController.swift
//  MyAcchiMuiteHoi
//
//  Created by CatLuck2 on 2018/08/20.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class ChoiceHandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //random_cpuHandメソッドを実行
        random_cpuHand()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //segue.identifierを指定して、他のViewControllerに変数を渡す処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //もしいずれかの矢印が選択されたら
        //goResultとは、矢印のButtonとResultViewControllerを連結するSegue.identifier
        if segue.identifier == "goResult" {
            //遷移先のResultViewControllerのインスタンスを作成
            let result_instance = segue.destination as! ResultViewController
            //Player(あなた)とCPUの手を渡す
            result_instance.Player_Hand = self.Player_Hand
            result_instance.CPU_Hand = self.CPU_Hand
            //ResultViewControllerで更新されたスコアを受け取る
            result_instance.score = self.SCORE
        }
    }
    
    //上右下左の手を用意
    let Hand = ["↑","→","↓","←"]
    
    //プレイヤーの手
    var Player_Hand = ""
    
    //CPUの手
    var CPU_Hand = ""
    
    //ResultViewControllerのscoreを受け取る変数
    var SCORE = 0
    
    //CPUの手をランダムに選択
    func random_cpuHand() {
        //配列の番号にUInt32は使えないので、Intに変換
        let random = Int(arc4random_uniform(4))
        CPU_Hand = Hand[random]
    }
    
    //上
    @IBAction func UPButton(_ sender: Any) {
        Player_Hand = Hand[0]
    }
    
    //下
    @IBAction func RIGHTButton(_ sender: Any){
        Player_Hand = Hand[1]
    }
    
    //右
    @IBAction func DOWNButton(_ sender: Any) {
        Player_Hand = Hand[2]
    }
    
    //左
    @IBAction func LEFTButton(_ sender: Any) {
        Player_Hand = Hand[3]
    }

}
