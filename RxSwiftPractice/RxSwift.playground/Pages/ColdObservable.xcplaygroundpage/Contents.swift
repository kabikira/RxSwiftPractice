//: [Previous](@previous)

import UIKit
import RxSwift

func myJust<E>(_ element: E) -> Observable<E> {
    return Observable.create { observer in
        observer.on(.next(element))
        observer.on(.completed)
        return Disposables.create()
    }
}

_ = myJust(100).subscribe(onNext: { value in
    print(value)
})
