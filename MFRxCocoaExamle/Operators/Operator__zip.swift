//
//  Operator__zip.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/26.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * zip
 * 通过一个函数将多个 Observables 的元素组合起来，然后将每一个组合的结果发出来
 * zip 操作符将多个(最多不超过8个) Observables 的元素通过一个函数组合起来，然后将这个组合的结果发出来。它会严格的按照序列的索引数进行组合。例如，返回的 Observable 的第一个元素，是由每一个源 Observables 的第一个元素组合出来的。它的第二个元素 ，是由每一个源 Observables 的第二个元素组合出来的。它的第三个元素 ，是由每一个源 Observables 的第三个元素组合出来的，以此类推。它的元素数量等于源 Observables 中元素数量最少的那个。
 *
 *
 *
 * 笔记: (1)zip后面需要跟参数(结合的Observables元素)
        (2)发出的元素组合为所有Observables对应的第N个元素,即都是第一个元素,第二个元素,以此类推
        (3)发出元素的数量等于Observables中元素数量最少的那个
 */
class Operator__zip: MBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.operatorUseExample1()
        self.operatorUseExample2()
        self.operatorUseExample3()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func operatorUseExample1() {
        let disposeBag = DisposeBag()
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        
        Observable.zip(first, second) { $0 + $1 }
            .subscribe(onNext: { print("example1 = \($0)") })
            .disposed(by: disposeBag)
        
        first.onNext("1")
        second.onNext("A")
        first.onNext("2")
        second.onNext("B")
        second.onNext("C")
        second.onNext("D")
        first.onNext("3")
        first.onNext("4")
    }

    func operatorUseExample2() {
        let disposeBag = DisposeBag()
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        
        Observable.zip(first, second) { $0 + $1 }
            .subscribe(onNext: { print("example2 = \($0)") })
            .disposed(by: disposeBag)
        
        first.onNext("1")
        second.onNext("A")
        first.onNext("2")
        second.onNext("B")
        second.onNext("C")
        second.onNext("D")
        first.onNext("3")
        first.onNext("4")
        first.onNext("5")
    }

    func operatorUseExample3() {
    }

}
