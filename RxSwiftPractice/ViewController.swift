//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by koala panda on 2023/07/16.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var viewModel: HogeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HogeViewModel()

        viewModel.helloWorldObservable
            .subscribe(onNext: { [weak self] value in
                print("value = \(value)")
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: disposeBag)

        viewModel.updateItem()
    }


}

class HogeViewModel {
    var helloWorldObservable: Observable<String> {
        return helloWorldSubject.asObserver()
    }
   private let helloWorldSubject = PublishSubject<String>()

    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()

    }

}

