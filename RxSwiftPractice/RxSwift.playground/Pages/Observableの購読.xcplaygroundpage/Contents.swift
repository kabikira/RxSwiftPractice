//: [Previous](@previous)

import RxSwift
import RxCocoa

let sequence = Observable.of(1, 2, 3, 4, 5)
sequence
    .subscribe(onNext: {_ in
        print("next")
    }, onError: { error in
        print("error")
    }, onCompleted: {
        print("conpletd")
    }, onDisposed: {
        print("disposed")
    })
