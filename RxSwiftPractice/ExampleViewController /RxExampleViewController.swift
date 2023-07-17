//
//  RxExampleViewController.swift
//  RxSwiftPractice
//
//  Created by koala panda on 2023/07/17.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class RxExampleViewController: UIViewController {

    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var addressField: UITextField!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!

    private let maxNameFieldSize = 10
    private let maxAddressFieldSize = 50

    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.rx.text
            .map{ [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxNameFieldSize = self?.maxNameFieldSize
                    else { return nil }
                let limitCount = maxNameFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)

        addressField.rx.text
            .map{ [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxAddressFieldSize = self?.maxAddressFieldSize
                else { return nil }
                let limitCount = maxAddressFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: addressLabel.rx.text)
            .disposed(by: disposeBag)
    }
    



}
