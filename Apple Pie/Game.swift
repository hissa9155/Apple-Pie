//
//  Game.swift
//  Apple Pie
//
//  Created by H.Namikawa on 2023/04/19.
//

import Foundation

struct Game {
  var word: String
  var incorrectWordsRemaining: Int
  var guessedLetters: [Character]
  var formattedWord: String {
    var guessedWord = ""
    for letter in word {
      if guessedWord.contains(letter){
        guessedWord += "\(letter)"
      } else {
        guessedWord += "_"
      }
    }
    return guessedWord
  }
  
  
  mutating func playerGuessed(letter:Character){
    guessedLetters.append(letter)
    if !word.contains(letter){
      incorrectWordsRemaining -= 1
    }
  }
  
  
  
}
