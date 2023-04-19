//
//  ViewController.swift
//  Apple Pie
//
//  Created by H.Namikawa on 2023/04/18.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var treeImageView: UIImageView!
  @IBOutlet var scoreLable: UILabel!
  @IBOutlet var correctWordLable: UILabel!
  
  
  @IBOutlet var letterButtons: [UIButton]!
  
  var currentGame: Game!
  var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
  var incorrectMovesAllowed = 7
  var totalWins = 0 {
    didSet {
      newRound()
    }
  }
  var totalLosses = 0 {
    didSet {
      newRound()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newRound()
  }
  
  func newRound() {
    if !listOfWords.isEmpty {
      let newWord = listOfWords.removeFirst()
      currentGame = Game(word: newWord, incorrectWordsRemaining: incorrectMovesAllowed, guessedLetters: [])
      enableLetterButtons(true)
      updateUI()
    } else {
      enableLetterButtons(false)
    }
  }
  
  func enableLetterButtons(_ enable:Bool){
    for button in letterButtons {
      button.isEnabled = enable
    }
  }
  
  func updateUI() {
    var letters = [String]()
    for letter in currentGame.formattedWord {
      letters.append(String(letter))
    }
    correctWordLable.text = currentGame.formattedWord
    scoreLable.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectWordsRemaining)")
    
  }
  
  @IBAction func letterButtonPressed(_ sender: UIButton) {
    sender.isEnabled = false
    let letterString = sender.configuration!.title!
    let letter = Character(letterString.lowercased())
    currentGame.playerGuessed(letter: letter)
    updateGameState()
  }
  
  func updateGameState() {
    if currentGame.incorrectWordsRemaining == 0 {
      totalLosses += 1
    } else if currentGame.word == currentGame.formattedWord {
      totalWins += 1
    } else {
      updateUI()
    }
  }
  
}

