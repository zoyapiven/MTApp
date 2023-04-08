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
    @IBOutlet weak var secondButton: UIButton!
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurebuttons()
        
    }
    private func configurebuttons() {
        var buttonsArray = [firsButton, secondButton]
        buttonsArray.forEach { button in
            button?.layer.shadowColor = UIColor.gray.cgColor
            button?.layer.shadowOffset = CGSize(width: 0, height: 3)
            button?.layer.shadowOpacity = 0.5
        }
    }
}



