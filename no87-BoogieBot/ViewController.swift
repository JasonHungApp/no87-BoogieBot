//
//  ViewController.swift
//  no87-BoogieBot
//
//  Created by jasonhung on 2024/7/22.
//

import UIKit

let smallBotDimensions = BoogieBot.BotDimensions(
    headFrame: CGRect(x: 62.5, y: 47.5, width: 25, height: 25),
    torsoFrame: CGRect(x: 50, y: 75, width: 50, height: 50),
    bootyFrame: CGRect(x: 50, y: 127.5, width: 50, height: 17.5),
    leftLegFrame: CGRect(x: 50, y: 147, width: 12.5, height: 60),
    rightLegFrame: CGRect(x: 87.5, y: 147, width: 12.5, height: 60),
    leftArmFrame: CGRect(x: 35, y: 75, width: 12.5, height: 50),
    rightArmFrame: CGRect(x: 102.5, y: 75, width: 12.5, height: 50),
    leftFingerFrame: CGRect(x: 0, y: 50, width: 3, height: 15),
    rightFingerFrame: CGRect(x: 7.5, y: 50, width: 3, height: 15),
    titleFrame: CGRect(x: 5, y: 15, width: 140, height: 25),
    subtitleFrame: CGRect(x: 5, y: 210, width: 140, height: 20)
)

let largeBotDimensions = BoogieBot.BotDimensions(
    headFrame: CGRect(x: 125, y: 95, width: 50, height: 50),
    torsoFrame: CGRect(x: 100, y: 150, width: 100, height: 120),
    bootyFrame: CGRect(x: 100, y: 272.5, width: 100, height: 35),
    leftLegFrame: CGRect(x: 100, y: 310, width: 25, height: 120),
    rightLegFrame: CGRect(x: 175, y: 310, width: 25, height: 120),
    leftArmFrame: CGRect(x: 70, y: 150, width: 25, height: 100),
    rightArmFrame: CGRect(x: 205, y: 150, width: 25, height: 100),
    leftFingerFrame: CGRect(x: 0, y: 100, width: 5, height: 30),
    rightFingerFrame: CGRect(x: 20, y: 100, width: 5, height: 30),
    titleFrame: CGRect(x: 10, y: 60, width: 280, height: 40),
    subtitleFrame: CGRect(x: 10, y: 420, width: 280, height: 40)
)

class ViewController: UIViewController, BoogieBotDelegate {
    var boogieBots: [BoogieBot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let botDimensions = [smallBotDimensions, largeBotDimensions, largeBotDimensions, smallBotDimensions]
        
        let botFrames = [
            CGRect(x: 30, y: 180, width: 100, height: 200),
            CGRect(x: 120, y: 40, width: 100, height: 200),
            CGRect(x: 0, y: 390, width: 100, height: 200),
            CGRect(x: 250, y: 560, width: 100, height: 200)
        ]
        
        let customTitles = ["Jenny", "Peter", "Jason", "Stu"] // 使用者自定義的名稱
        
        for (index, dimensions) in botDimensions.enumerated() {
            let botFrame = botFrames[index]
            let boogieBot = BoogieBot(frame: botFrame, dimensions: dimensions)
            boogieBot.setScale(1.0)
            boogieBot.boogieDelegate = self
            view.addSubview(boogieBot)
            boogieBots.append(boogieBot)
            boogieBot.title = customTitles[index] // 使用自定義名稱
            boogieBot.subtitle = "Let's dance!"
            botDoMoves(boogieBot: boogieBot)
            
        }
    }
    
    func dancingFinished(bot: BoogieBot) {
        print("\(bot.title) finished dancing!")
        botDoMoves(boogieBot: bot)
    }
    
    func botDoMoves(boogieBot:BoogieBot){
        boogieBot.doMoves([.fabulize,
                           .leftArmUp, .rightArmUp,
                           .shakeItLeft, .shakeItRight, .shakeItCenter,
                           .leftLegUp, .leftLegDown,
                           .rightLegUp, .rightLegDown,
                           .rightArmDown, .leftArmDown,
                           .leftArmUp, .rightLegUp,
                           .leftArmDown, .rightLegDown,
                           .rightArmUp,.leftLegUp,
                           .leftArmDown, .leftLegDown,
                           
        ])
    }
}
