//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Admin on 01/07/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
                Question(q: "Four + Two equals to Six", a: "True"),
                Question(q: "Five - three greater than one", a: "True"),
                Question(q: "three + eight is less than ten", a: "False")
                ]
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }else
        {
            return false
        }
        
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float
    {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
        
    }

}
