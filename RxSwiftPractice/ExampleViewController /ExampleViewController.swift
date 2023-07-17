//
//  ExampleViewController.swift
//  RxSwiftPractice
//
//  Created by koala panda on 2023/07/17.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressField: UITextField!
    @IBOutlet private weak var addressLabel: UILabel!

    private let maxNameFieldSize = 10
    private let maxAddressFieldSize = 50

    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 実際の処理が別関数として離れているので処理のながれが少しイメージしにくい
        nameField.addTarget(self, action: #selector(nameFieldEditingChanged(sender:)), for: .editingChanged)
        addressField.addTarget(self, action: #selector(addressFieldEditingChanged(sender:)), for: .editingChanged)
        }

    @objc func nameFieldEditingChanged(sender: UITextField) {
        guard let changeText = sender.text else { return }
        let limitCount = maxNameFieldSize - changeText.count
        nameLabel.text = limitText(limitCount)
    }

    @objc func addressFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = maxAddressFieldSize - changedText.count
        addressLabel.text = limitText(limitCount)
    }
}
