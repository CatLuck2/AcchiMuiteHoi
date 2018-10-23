//
//  ResultViewController.swift
//  MyAcchiMuiteHoi
//
//  Created by CatLuck2 on 2018/08/20.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //displayresultとresultを実行
        displayresult()
        result()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //あなたの手を表示
    @IBOutlet weak var PLAYERLabel: UILabel!
    
    //CPUの手を表示
    @IBOutlet weak var CPULabel: UILabel!
    
    //遷移する際の処理
    //勝ち負けの判定によって、遷移先を条件分岐
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //あなたが勝った場合（Player_HandとCPU_Handが一致しない場合）
        if segue.identifier == "WIN" {
            //遷移先のインスタンスを作成
            let choice_instance = segue.destination as! ChoiceHandViewController
            //勝ったらscore変数に1を追加
            self.score += 1
            //ChoiceHandViewControllerのSCORE変数にscore変数を渡す
            choice_instance.SCORE += self.score
        //あなたが負けた場合（Player_HandとCPU_Handが一致する場合）
        } else if segue.identifier == "LOSE" {
            //遷移先のインスタンスを作成
            let gameover_instance = segue.destination as! GameOverViewController
            //総勝利数のスコアとして、GameOverViewControllerのScore変数に渡す
            gameover_instance.Score = self.score
        }
    }
    
    //勝敗の判定を表す変数
    var winorlose = ""
    
    //スコアを保持する変数
    var score = 0
    
    //ChoiceHandViewControllerから渡される矢印を受け取る変数
    var Player_Hand = ""
    var CPU_Hand = ""
    
    //両者の手を表示
    func displayresult() {
        //プレイヤーの手を表示
        PLAYERLabel.text = Player_Hand
        //CPUの手を表示
        CPULabel.text = CPU_Hand
    }
    
    //勝敗を判定する処理
    func result() {
        //負けた場合
        if Player_Hand == CPU_Hand {
            winorlose = "lose"
        //勝った場合
        } else {
            winorlose = "win"
        }
    }
    
    
    //プレイヤーが勝ちなら前画面に戻る、負けならゲーム終了
    @IBAction func ChangeViewButton(_ sender: Any) {
        //もし勝ったら、ChoiceViewControllerに遷移する
        if winorlose == "win" {
            performSegue(withIdentifier: "WIN", sender: nil)
        //もし負けたら、GameOverViewControllerに遷移する
        } else if winorlose == "lose" {
            performSegue(withIdentifier: "LOSE", sender: nil)
        }
    }

}
