//
//  SimpleTapViewController.swift
//  RxSwiftPractice
//
//  Created by koala panda on 2023/07/16.
//

import UIKit

class SimpleTapViewController: UIViewController {
    @IBOutlet private weak var messageLabel: UILabel!

    @IBAction private func tapLoginButton(_ sender: Any) {
        messageLabel.text = "Tap Login Button!"
    }
    @IBAction private func tapResetPasswordButton(_ sender: Any) {
        messageLabel.text = "Tap Reset password Button!"
    }

    @IBAction private func tapExitButton(_ sender: Any) {
        messageLabel.text = "Tap Exit Button!"
    }
    @IBAction private func tapHelpButton(_ sender: Any) {
        messageLabel.text = "Tap Help Button!"
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
