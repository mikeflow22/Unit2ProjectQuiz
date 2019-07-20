//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    let triviaController = TriviaController()
    
    //second commit
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    
    var gameSound: SystemSoundID = 0
    var removedArray = [Trivia]()
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var correctionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: triviaController.questions.count)
//        let questionDictionary = trivia[indexOfSelectedQuestion]
        let questionArray = triviaController.questions[indexOfSelectedQuestion]
//        questionField.text = questionDictionary["Question"]
        questionField.text = questionArray.question
        
        answer1.setTitle(questionArray.choices[0], for: .normal)
        answer2.setTitle(questionArray.choices[1], for: .normal)
        answer3.setTitle(questionArray.choices[2], for: .normal)
        answer4.setTitle(questionArray.choices[3], for: .normal)
        playAgainButton.isHidden = true
        correctionLabel.isHidden = true
        
        print("questions before getting rid of one: \(triviaController.questions.count)")
//        triviaController.questions.remove(at: indexOfSelectedQuestion)
////        indexOfSelectedQuestion = triviaController.questions.count
//        print("questions.count \(triviaController.questions.count)")
    }
    
    func displayScore() {
        // Hide the answer uttons
      
        // Display play again button
        playAgainButton.isHidden = false
        correctionLabel.isHidden = true
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(removedArray.count) correct!"
    }
    
    func nextRound() {
      
        if triviaController.questions.count == 0 {
            print("Questions Asked: \(questionsAsked) vs questions.count: \(removedArray.count)")
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
//        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
//        let correctAnswer = selectedQuestionDict["Answer"]
        let selectedQuestionsArray = triviaController.questions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionsArray.answer
        
        if (sender.tag == correctAnswer) {
            correctQuestions += 1
//            questionField.text = "Correct!"
            correctionLabel.isHidden = false
            correctionLabel.text = "Correct!"
        } else {
//            questionField.text = "Sorry, wrong answer!"
             correctionLabel.isHidden = false
            correctionLabel.text = "Sorry, wrong answer!!"
        }
        
        let remove = triviaController.questions.remove(at: indexOfSelectedQuestion)
        removedArray.append(remove)
        print("removedArray: \(removedArray.count)")
        indexOfSelectedQuestion = triviaController.questions.count
        print("questions.count \(triviaController.questions.count)")

        loadNextRound(delay: 2)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        // Show the answer buttons
     
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

}

