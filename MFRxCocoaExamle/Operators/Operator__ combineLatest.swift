//
//  Operator__ combineLatest.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/20.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * combineLatest
 * 当多个 Observables 中任何一个发出一个元素，就发出一个元素。这个元素是由这些 Observables 中最新的元素，通过一个函数组合起来的
 * combineLatest 操作符将多个 Observables 中最新的元素通过一个函数组合起来，然后将这个组合的结果发出来。这些源 Observables 中任何一个发出一个元素，他都会发出一个元素（前提是，这些 Observables 曾经发出过元素）。
 *
 *
 *
 * 笔记: (1)可以任意组合N个Observables对象
        (2)组合方式由自己指定,返回值和withLatestFrom一样,由自己指定格式
        (3)组合的Observables要都曾经发出过元素
    
 */

class Operator___combineLatest: MBaseViewController {

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
        
        Observable.combineLatest(first, second) { $0 + $1 }
            .subscribe(onNext: { print("s1 = \($0)") })
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
    
    //MARK: Custom Use
    func operatorUseExample2() {
        let disposeBag = DisposeBag()
        
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        
        Observable.combineLatest(first, second) {
            return ($0, $1)
            }.subscribe {
                print("s2 = \($0)")
        }.disposed(by: disposeBag)
        
        first.onNext("1")
        second.onNext("A")
        first.onNext("2")
        second.onNext("B")
        second.onNext("C")
        second.onNext("D")
        first.onNext("3")
        first.onNext("4")

    }

    func operatorUseExample3() {
        let disposeBag = DisposeBag()
        
        let first = PublishSubject<String>()
        let second = PublishSubject<String>()
        let third = PublishSubject<String>()

        Observable.combineLatest(first, second, third) {
            return ($0, $1, $2)
            }.subscribe {
                print("s3 = \($0)")
            }.disposed(by: disposeBag)
        
        first.onNext("1")
        second.onNext("A")
        first.onNext("2")
        second.onNext("B")
        second.onNext("C")
        third.onNext("D")
        first.onNext("3")
        first.onNext("4")
        third.onNext("3")
        first.onNext("4")

    }

}

