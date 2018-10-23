//
//  GameOverViewController.swift
//  MyAcchiMuiteHoi
//
//  Created by CatLuck2 on 2018/08/20.
//  Copyright © 2018年 CatLuck2. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        display_score()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    //ResultViewControllerで渡されたscoreを格納する変数
    var Score = 0
    
    //勝った回数を表示
    func display_score() {
        ScoreLabel.text = "\(Score)"
    }

}
