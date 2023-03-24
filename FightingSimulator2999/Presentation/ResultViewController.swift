//
//  ResultViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit

class ResultViewController: UIViewController {
    enum Result {
        case win
        case lose
    }

    var result: Result = .lose

    @IBOutlet
    private var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        switch result {
            case .win:
                resultLabel.text = "You win!"
            case .lose:
                resultLabel.text = "You lose!"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction
    private func restartTap() {
        navigationController?.popViewController(animated: false)
    }
}
