//
//  ViewController.swift
//  Quizzler
//
//  Created by Abdeljaouad Mezrari on 25/02/2023.
//  Copyright © 2023 Abdeljaouad Mezrari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var FalseBtn: UIButton!
    @IBOutlet weak var TrueBtn: UIButton!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    var quizze = Quizze()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UpdateQuizeQuestion()
    }
    
    @IBAction func Answer(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let checkAnswer = quizze.checkAnswer(answer: userAnswer)
        if checkAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(UpdateQuizeQuestion), userInfo: nil, repeats: false)
    }
    
    @objc func UpdateQuizeQuestion(){
        self.QuestionLabel.text = quizze.NextQuizeQuestion()
        UpdateProgressBar()
        TrueBtn.backgroundColor = UIColor.clear
        FalseBtn.backgroundColor = UIColor.clear
    }
    
    func UpdateProgressBar(){
        self.ProgressBar.progress = quizze.QuizzeProgress
    }
}

