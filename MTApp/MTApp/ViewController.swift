//
//  ViewController.swift
//  MTApp
//
//  Created by Miroslav Deryuga on 03.04.2023.
//

import UIKit

enum MathTypes: Int {
    case add, substruct, multiply, divide
}

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    // MARK: - Properties
    private var selectedType: MathTypes = .add
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // вызвается когда загружен экран
        configurebuttons()
    }
    
    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        // нажатие на любую из кнопок будет обрабатываться в этой функции
        // sender.tag добавляет уникальное св-во для каждой копки
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) { }
    
    // MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControler = segue.destination as? TrainViewController {
            viewControler.type = selectedType
        }
    }
    
    private func configurebuttons() {
        // add shadow
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 3)
            button.layer.shadowOpacity = 0.5
            //button.layer.shadowRadius blurs the shadow
        }
    }
}

