//
//  GameViewController.swift
//  WhackAMole
//
//  Created by Ivan Semenov on 24.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        setupSuperView()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .systemIndigo
    }
}
