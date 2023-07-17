import RxSwift

let prices = [100, 250, 560, 980]
let taxRate =  1.08

Observable
    .from(prices)
    .map({ price in Int(Double(price) * taxRate)

    })
    .subscribe({ event in
        print(event)
    })
    .dispose()
