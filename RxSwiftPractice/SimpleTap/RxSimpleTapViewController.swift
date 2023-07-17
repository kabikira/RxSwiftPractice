//
//  RxSimpleTapViewController.swift
//  RxSwiftPractice
//
//  Created by koala panda on 2023/07/16.
//

import UIKit
import RxSwift
import RxCocoa

class RxSimpleTapViewController: UIViewController {


    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var resetPasswordButton: UIButton!
    @IBOutlet private weak var exitButton: UIButton!
    @IBOutlet private weak var helpButton: UIButton!

    @IBOutlet private weak var messageLabel: UILabel!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap Login Button!"
            })
            .disposed(by: disposeBag)

        resetPasswordButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap Reset Password Button!"
            })
            .disposed(by: disposeBag)

        exitButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap Exit Button!"
            })
            .disposed(by: disposeBag)

        helpButton.rx.tap
            .subscribe(onNext:  { [weak self] in
                self?.messageLabel.text = "Tap Help Button!"
            })
            .disposed(by: disposeBag)
    }


}
