//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizbrain = QuizBrain()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
       
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        
        let userGotItRight = quizbrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
       
        quizbrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func updateUI()
    {
        questionLabel.text = quizbrain.getQuestionText()
        progressBar.progress = quizbrain.getProgress()
        scoreLabel.text = "score:\(quizbrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
        
    }

}
