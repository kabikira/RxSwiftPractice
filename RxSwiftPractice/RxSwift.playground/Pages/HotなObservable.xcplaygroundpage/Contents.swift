//: [Previous](@previous)

import RxSwift

func test() {
    let disposeBag = DisposeBag()

    // Subject作成
    let subject = PublishSubject<String>()

    subject.onNext("🍎")

    // Observer1購読
    subject
        .subscribe(onNext: { elemet in
            print("Observer: 1 - Event: \(elemet)")
        }, onCompleted: {
            print("Observer: 1 - Event: completed")
        }, onDisposed: {
            print("Obserber: 1 - Event: disposed")
        })
        .disposed(by: disposeBag)
    subject.onNext("🍣")

    // Observer2購読
    subject
        .map({ element in
            "\(element) is nice!"
        })
        .subscribe(onNext: { element in
            print("Observer: 2 - Event: \(element)")
        }, onCompleted: {
            print("Observer: 2 - Event: completed")
        }, onDisposed: {
            print("Observer: 2 - Event: disposed")
        })
        .disposed(by: disposeBag)

    subject.onNext("🍔")

    // Observer3購読
    subject
        .subscribe(onNext: { element in
            print("Observer: 3 - Event: \(element)")
        }, onCompleted: {
            print("Observer: 3 - Event: completed")
        }, onDisposed: {
            print("Observer: 3 - Event: disposed")
        })
        .disposed(by: disposeBag)

    subject.onNext("🍜")

    subject.onCompleted()
}

test()


