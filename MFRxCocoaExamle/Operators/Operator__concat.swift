//
//  Operator__concat.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/25.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * concat
 * 让两个或多个 Observables 按顺序串连起来
 * concat 操作符将多个 Observables 按顺序串联起来，当前一个 Observable 元素发送完毕后，后一个 Observable 才可以开始发出元素。
 
 * concat 将等待前一个 Observable 产生完成事件后，才对后一个 Observable 进行订阅。如果后一个是“热” Observable ，在它前一个 Observable 产生完成事件前，所产生的元素将不会被发送出来。
 
 * startWith 和它十分相似。但是startWith不是在后面添加元素，而是在前面插入元素。
 
 * merge 和它也是十分相似。merge并不是将多个 Observables 按顺序串联起来，而是将他们合并到一起，不需要 Observables 按先后顺序发出元素。
 *
 *
 *
 * 笔记: (1)concat和merge类似,后面都不需要跟参数
        (2)串联起来后,会先发送第一个Observable的元素,当第一个发送完毕后,才会发送第二个Observable,此时发送的元素为第二个的最新元素,过期的元素不会再次发送
        (3)当第二个发送完毕后,会接着发送第三个,以此类推
 */
class Operator__concat: MBaseViewController {

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
        
        let subject1 = BehaviorSubject(value: "🍎")
        let subject2 = BehaviorSubject(value: "🐶")
        
        let variable = Variable(subject1)
        
        variable.asObservable()
            .concat()
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        subject1.onNext("🍐")
        subject1.onNext("🍊")
        
        variable.value = subject2
        
        subject2.onNext("I would be ignored")
        subject2.onNext("🐱")
        
        subject1.onCompleted()
        
        subject2.onNext("🐭")
        
    }
    
    func operatorUseExample2() {
        
    }
    
    func operatorUseExample3() {
        //
    }

}
