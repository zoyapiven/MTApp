//
//  TrainViewController.swift
//  MTApp
//
//  Created by Miroslav Deryuga on 06.04.2023.
//

import UIKit // includes Foundation frameWork

final class TrainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var firsButton: UIButton!
    
    @IBOutlet weak var testCouterLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    
    // MARK: - Properties
    private var count: Int = 0 {
        didSet {
            testCouterLabel.text = String(count)
        }
    }
    private var mathSign: String = ""
    private var firstNumber = 0
    private var secondNumber = 0
    var type: MathTypes = .add {
        didSet {
            switch type {
            case .add:
                mathSign = "+"
            case .divide:
                mathSign = "/"
            case .multiply:
                mathSign = "*"
            case .substruct:
                mathSign = "-"
            }
        }
    }
    
    private var answer: Int {
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .substruct:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .divide:
            return firstNumber / secondNumber
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hg")
        configureQuestion()
        configurebuttons()
    }
    
    // MARK: - IBActions
    @IBAction func firstButton(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction func secondButton(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    // MARK: - Methods
    private func configurebuttons() {
        let buttonsArray = [firsButton, secondButton]
        buttonsArray.forEach {button in
            button?.backgroundColor = .systemYellow
        }
        
        buttonsArray.forEach { button in
            button?.layer.shadowColor = UIColor.gray.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 3)
            button?.layer.shadowOpacity = 0.5
        }
        
        let isRightButton = Bool.random()
        var randomAnswer: Int
        repeat {
            randomAnswer = Int.random(in: (answer - 10)...(answer + 10))
        } while randomAnswer == answer
        
        secondButton.setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal)
        firsButton.setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
    }
    
    private func configureQuestion(){
        // TODO: add spetial operation for multiply and substruct (swich/ if else)
        firstNumber = Int.random(in: 1...99)
        secondNumber = Int.random(in: 1...99)
        if type == .divide {
            while firstNumber % secondNumber != 0 || firstNumber == secondNumber {
                firstNumber = Int.random(in: 1...99)
                secondNumber = Int.random(in: 1...firstNumber)
            }
        }
        let question: String = "\(firstNumber) \(mathSign) \(secondNumber) ="
        questionLabel.text = question
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRightAnswer = Int(answer) == self.answer
        
        button.backgroundColor = isRightAnswer ? .green : .red
        
        if isRightAnswer {
            var isSecondAttempt = secondButton.backgroundColor == .red ||
            firsButton.backgroundColor == .red
            if !isSecondAttempt {
                count += 1
               // count += isSecondAttempt ? 0 : 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self ] in
                
                self?.configureQuestion()
                self?.configurebuttons()
            }
        }
    }
    
}



