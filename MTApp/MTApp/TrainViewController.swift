//
//  TrainViewController.swift
//  MTApp
//
//  Created by Miroslav Deryuga on 06.04.2023.
//

import UIKit // includes Foundation frameWork

final class TrainViewController: UIViewController {
// MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
}
