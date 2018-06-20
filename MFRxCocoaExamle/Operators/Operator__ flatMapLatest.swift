//
//  Operator__ flatMapLatest.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/20.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * flatMapLatest
 * 将 Observable 的元素转换成其他的 Observable，然后取这些 Observables 中最新的一个
 * flatMapLatest 操作符将源 Observable 的每一个元素应用一个转换方法，将他们转换成 Observables。一旦转换出一个新的 Observable，就只发出它的元素，旧的 Observables 的元素将被忽略掉。
 *
 *
 *
 * 笔记: (1)Observable在使用flatMapLatest时就会对其元素进行转换,成为新的Observable
        (2)flatMapLatest转换返回的是一个Observable对象(可以使用函数方法返回一个Observable对象,并异步用此Observable发送信号)
        (3)新的Observable元素产生后,旧的Observable元素将被忽略掉
 
 */
class Operator___flatMapLatest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.operatorUseExample1()
        self.operatorUseExample2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func operatorUseExample1() {
        let disposeBag = DisposeBag()
        let first = BehaviorSubject(value: "👦🏻")
        let second = BehaviorSubject(value: "🅰️")
        let variable = Variable(first)
        
        variable.asObservable()
            .flatMapLatest { $0 }
            .subscribe(onNext: { print("example1 = \($0)") })
            .disposed(by: disposeBag)
        
        first.onNext("🐱")
        variable.value = second
        second.onNext("🅱️")
        first.onNext("🐶")
    }

    //MARK: Custom Use
    func operatorUseExample2() {
        let disposeBag = DisposeBag()
        let first = BehaviorSubject(value: "👦🏻")
        let second = BehaviorSubject(value: "🅰️")
        let variable = Variable(first)

        variable.asObservable().flatMapLatest { $0 }.subscribe {
            print("example2 = \($0)")
        }.disposed(by: disposeBag)
        
        first.onNext("🐱")
        variable.value = second
        second.onNext("🅱️")
        first.onNext("🐶")
        
    }

}
