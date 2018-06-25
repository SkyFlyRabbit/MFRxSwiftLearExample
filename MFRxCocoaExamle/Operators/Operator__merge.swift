//
//  Operator__merge.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/25.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * merge
 * 将多个 Observables 合并成一个
 * 通过使用 merge 操作符你可以将多个 Observables 合并成一个，当某一个 Observable 发出一个元素时，他就将这个元素发出。
 * 如果，某一个 Observable 发出一个 onError 事件，那么被合并的 Observable 也会将它发出，并且立即终止序列。
 *
 *
 *
 * 笔记:(1)merge跟在后面,内部无参数,表示将多个Observables合并为一个
       (2)当某个Observables发出元素时,就会将这个元素发出,所以每次发出的元素只有一个
       (3)如果某个Observables发出一个onError事件,那么合并的Observables就会将它发送出去,并立即终止序列
 */
class Operator__merge: MBaseViewController {

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
        
        let subject1 = PublishSubject<String>()
        let subject2 = PublishSubject<String>()
        
        Observable.of(subject1, subject2)
            .merge()
            .subscribe(onNext: { print("example1 = \($0)") })
            .disposed(by: disposeBag)
        
        subject1.onNext("🅰️")
        
        subject1.onNext("🅱️")
        
        subject2.onNext("①")
        
        subject2.onNext("②")
        
        subject1.onNext("🆎")
        
        subject2.onNext("③")
        
    }
    
    func operatorUseExample2() {
        let disposeBag = DisposeBag()
        
        let subject1 = PublishSubject<String>()
        let subject2 = PublishSubject<String>()
        
        Observable.of(subject1, subject2).merge().subscribe(onNext: {
            print("example2 = \($0)")
        }).disposed(by: disposeBag)
        
    }
    
    func operatorUseExample3() {
        //
    }

}
