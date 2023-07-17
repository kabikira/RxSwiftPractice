//: [Previous](@previous)

import RxSwift

func createSample() {
    let disposeBag = DisposeBag()

    // マニュアルなObservableの作成
    let obsevable = Observable<String>
        .create({ observer in
            observer.onNext("🍺")
            observer.onNext("🍶")
            observer.onNext("🍷")
            observer.onCompleted()

            return Disposables.create {
                print("Observable: Dispose")
            }

        })

    // Observer購読
    obsevable
        .subscribe(onNext: { element in
                print("Observer: \(element)")
        }, onDisposed:  {
            print("Observer: onDisposed")
        })
        .disposed(by: disposeBag)
}

createSample()
