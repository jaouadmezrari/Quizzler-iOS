//
//  Question.swift
//  Quizzler
//
//  Created by mac on 2/3/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: String
}

struct Quizze {
    let Questions = [
        Question(text: "6 + 8 = 14", answer:"True"),
        Question(text: "5 * 3 = 15", answer:"True"),
        Question(text: "2 * 9 = 16", answer:"False"),
        Question(text: "3 * 2 = 6", answer:"True"),
        Question(text: "9 * 9 = 82", answer:"False"),
        Question(text: "20 * 10 = 200", answer:"True"),
    ]
    var QuizzPosition = 0
    var QuizzScore = 0
    var QuizzeProgress : Float = 0.0

    mutating func checkAnswer(answer: String) -> Bool{
        if answer == Questions[QuizzPosition].answer {
            self.QuizzScore += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func NextQuizeQuestion() -> String{
        
        if(QuizzPosition < Questions.count-1) {
            QuizzPosition += 1
            QuizzeProgress = Float(self.QuizzPosition) / Float(Questions.count)
            return Questions[QuizzPosition].text
        }
        QuizzeProgress = 1
        return "Your score is \(QuizzScore)/\(Questions.count)"
    }
}
