//: [Previous](@previous)


import UIKit
import RxSwift
import RxCocoa
import RxOptional


//let observable = Observable<String>.just("Hello, RxSwift!")
//
//let subscription = observable.subscribe(onNext: { value in
//    print(value) // "Hello, RxSwift!"と出力される
//})
//
//// map
//subscription.dispose() // 購読を終了
//let numbers: Observable<Int> = Observable.of(1, 2, 3)
////numbers.map { $0 * 2 }.subscribe(onNext: { print($0) }) // 2, 4, 6と出力
//let sub = numbers.map{ $0 * 2 }.subscribe(onNext: { print($0) })
//sub.dispose()
//
//// filter
//numbers.filter { $0 % 2 == 0 }.subscribe(onNext: { print($0) }) // 2と出力

//
//Observable<String?>
//    .of("One", nil, "Three")
//    .filter{ $0 != nil }
//    .map { $0! }
//    .subscribe { print($0) }

// これじゃエラーがでる
//Observable<String?>
//    .of("One", nil, "Three")
//    .filterNil()
//    .subscribe { print($0) }
Observable.of("One", nil, "Three")
    .compactMap { $0 }
    .subscribe { print($0) }


let hogeRelay = BehaviorRelay(value: "A")
let hogeThread = Thread() {
    sleep(1)
    hogeRelay.accept("B")
    sleep(1)
    hogeRelay.accept("C")
}
hogeThread.start()

hogeRelay
    .subscribeOn(MainScheduler.instance)
    .do(onNext: { _ in
        // hogeThread で accept したものは hogeThread で動作（subscribeOn が効いていない）
    })
    .observeOn(MainScheduler.instance)
    .subscribe(onNext: { _ in
        // メインスレッドで動作する
})

//_ = Observable.just(10)
//     .map { $0 * 2 }
//     .subscribe(onNext: {
//         print($0) // => 20
// })

_ = Observable.just(10)
    .map { (arg: Int) -> Int in
        return arg * 2
    }
    .subscribe(onNext: { (arg: Int) -> Void in
        print(arg)
    })
//let subject = PublishSubject<String>()
//let _ = subject.subscribe(onNext: {
//    print("onNext:", $0)
//}, onCompleted: {
//    print("onCompleted:")
//})
//subject.onNext("A")
//subject.onNext("B")
//subject.onNext("C")
//subject.onNext("D")
//subject.onCompleted()
//
let subject = PublishSubject<String>()
let subscription = subject
    .subscribe(onNext: {
        print("onNext: ", $0)
    }, onCompleted: {
print("終了") }, onDisposed: {
print("破棄") })
subject.onNext("1")
subject.onNext("2")
subscription.dispose()
subject.onNext("3")
subject.onNext("4")
subject.onCompleted()
print("-----combineLatest-----")
let password = PublishSubject<String>()
let repeatedPassword = PublishSubject<String>()
_ = Observable.combineLatest(password, repeatedPassword) { "\($0), \($1)"}
      .subscribe(onNext: { print("onNext: ", $0) })
password.onNext("a")
password.onNext("ab")
repeatedPassword.onNext("A")
repeatedPassword.onNext("AB")
repeatedPassword.onNext("ABC")
print("-----zip-----")
// イベントが揃ったら動作する仕組みとして割り切って使う
let intSubject = PublishSubject<Int>()
let stringSubject = PublishSubject<String>()
_ = Observable.zip(intSubject, stringSubject) {
    "\($0) \($1)"
}
.subscribe(onNext: { print($0) })

intSubject.onNext(1)
intSubject.onNext(2)

stringSubject.onNext("A")
stringSubject.onNext("B")
stringSubject.onNext("C")
stringSubject.onNext("D")

intSubject.onNext(3)
intSubject.onNext(4)
