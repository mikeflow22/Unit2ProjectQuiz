//
//  TriviaController.swift
//  EnhanceQuizStarter
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation


class TriviaController {
    var questions = [Trivia]()
    
    init(){
        addQuestions()
    }
    
    func addQuestions(){
        questions += [
        Trivia(question: "This was the only US President to server more than two consecutive terms?", choices: ["George Washington", "Franklin D Roosevelt", "Woodrow Wilson", "Andrew Jackson"], answer: 2),
        Trivia(question: "Which of the following countries has the most residents?", choices: ["Nigeria", "Russia", "Iran", "Vietnam"], answer: 1),
        Trivia(question: "In what year was the United Nations founded?", choices: ["1918", "1919", "1945", "1954"], answer: 3),
        Trivia(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", choices: ["Paris", "Washington D.C.", "New York City", "Boston"], answer: 3),
        Trivia(question: "Which nation produces the most oil?", choices: ["Iran", "Iraq", "Brazil", "Canada"], answer: 4),
        Trivia(question: "Which country has most recently won consecutive World Cups in Soccer?", choices: ["Italy", "Brazil", "Argentina", "Spain"], answer: 2),
        Trivia(question: "Which of the following rivers is lognest?", choices: ["Yangtze", "Mississippi", "Congo", "Mekong"], answer: 2),
        Trivia(question: "Which city is the oldest?", choices: ["Mexico City", "Cape Town", "San Juan", "Sydney"], answer: 1),
        Trivia(question: "Which country was the first to allow women to vote in national elections?", choices: ["Poland", "United States", "Sweden", "Senegal"], answer: 1),
        Trivia(question: "Which of these countries wont the most medals in the 2012 Summer Games?", choices: ["France", "Germany", "Japan", "Great Britian"], answer: 4),
//        Trivia(question: <#T##String#>, choices: <#T##[String]#>, answer: <#T##String#>),
//        Trivia(question: <#T##String#>, choices: <#T##[String]#>, answer: <#T##String#>),
        ]
    }
}
