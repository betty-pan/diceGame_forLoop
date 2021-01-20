//
//  ViewController.swift
//  diceGame_forLoop
//
//  Created by Betty Pan on 2021/1/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playerScoreLabel: [UILabel]!
    @IBOutlet var playerPointLabel: [UILabel]!
    @IBOutlet var playerADiceImageView: [UIImageView]!
    @IBOutlet var playerBDiceImageView: [UIImageView]!
    @IBOutlet var winImageView: [UIImageView]!
    @IBOutlet weak var replayBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    var diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var playerAPoint = 0
    var playerBPoint = 0
    
    var playerAScore = 0
    var playerBScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使骰子依序排列，上排1-3,下排4-6
        for i in 0...2 {
            playerADiceImageView[i].image = UIImage(named: String(diceImages[i]))
            playerBDiceImageView[i].image = UIImage(named: String(diceImages[i+3]))
        }
        //隱藏Roll Again Btn
        replayBtn.isHidden = true
    }
    
    
    @IBAction func rollDice(_ sender: UIButton) {
        //每次按下Btn，骰子點數歸零
        playerAPoint = 0
        playerBPoint = 0
        
        //設[骰子點數Label].backgroundColor
        for i in playerPointLabel {
            i.backgroundColor = UIColor.lightGray
        }
        
        //i迴圈 = 3, 設圖片點數(亂數), 亂數出圖[array從零開始因此需-1], 總共三張圖因此總和為三圖的數字相加
        for i in playerADiceImageView {
            let dicePoint = 4
            i.image = UIImage(named: diceImages[dicePoint-1])
            playerAPoint = playerAPoint + dicePoint
        }
        for i in playerBDiceImageView {
            let dicePoint = Int.random(in: 1...6)
            i.image = UIImage(named: diceImages[dicePoint-1])
            playerBPoint = playerBPoint + dicePoint
        }
        playerPointLabel[0].text = "\(playerAPoint)"
        playerPointLabel[1].text = "\(playerBPoint)"
        
        //判斷骰子點數輸贏
        if playerAPoint > playerBPoint {
            playerAScore = playerAScore + 1
            playerPointLabel[0].backgroundColor = UIColor.yellow
        }else if playerAPoint < playerBPoint{
            playerBScore = playerBScore + 1
            playerPointLabel[1].backgroundColor = UIColor.yellow
        }
        playerScoreLabel[0].text = "\(playerAScore)"
        playerScoreLabel[1].text = "\(playerBScore)"
        
        //先達5分獲勝
        if playerAScore==5{
            playBtn.isHidden = true
            replayBtn.isHidden = false
            winImageView[0].image = UIImage(named: "win")
        }else if playerBScore==5{
            playBtn.isHidden = true
            replayBtn.isHidden = false
            winImageView[1].image = UIImage(named: "win")
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        playerAScore = 0
        playerBScore = 0
        playerAPoint = 0
        playerBPoint = 0
        playerScoreLabel[0].text = "\(playerAScore)"
        playerScoreLabel[1].text = "\(playerBScore)"
        playerPointLabel[0].text = "\(playerAPoint)"
        playerPointLabel[1].text = "\(playerBPoint)"
        
        replayBtn.isHidden = true
        playBtn.isHidden = false
        
        //設[骰子點數Label].backgroundColor
        for i in playerPointLabel {
            i.backgroundColor = UIColor.lightGray
        }
        //設[win圖片].image為空白
        for i in winImageView {
            i.image = UIImage(named: "")
        }
        
    }
    
}

