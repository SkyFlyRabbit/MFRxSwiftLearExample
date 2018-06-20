//
//  Operator--WithLatestFrom.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/18.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * withLatestFrom
 * 将两个 Observables 最新的元素通过一个函数组合起来，当第一个 Observable 发出一个元素，就将组合后的元素发送出来
 * withLatestFrom 操作符将两个 Observables 中最新的元素通过一个函数组合起来，然后将这个组合的结果发出来。当第一个 Observable 发出一个元素时，就立即取出第二个 Observable 中最新的元素，通过一个组合函数将两个最新的元素合并后发送出去。
 *
 *
 *
 * 笔记: (1)组合方式默认拼接方式,但是可以由自己指定(其实就是自定义一个函数,给出返回值)
        (2)第二个Observables要发出过元素,第一个在发出元素时才会进行取出第二个Observables中最新元素的操作
 */
class Operator___withLatestFrom: MBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.operatorUseExample1()
        self.operatorUseExample2()
        self.operatorUseExample3()
        self.operatorUseExample4()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
     * 当第一个 Observable 发出一个元素时，就立即取出第二个 Observable 中最新的元素，然后把第二个 Observable 中最新的元素发送出去。
     */
    func operatorUseExample1() {
        let disposeBag = DisposeBag()
        
        let firstSubject = PublishSubject<String>()
        let secondSubject = PublishSubject<String>()
        
        firstSubject
            .withLatestFrom(secondSubject)
            .subscribe(onNext: { print("output1 = \($0)") })
            .disposed(by: disposeBag)
        
        firstSubject.onNext("🅰️")
        firstSubject.onNext("🅱️")
        secondSubject.onNext("1")
        secondSubject.onNext("2")
        firstSubject.onNext("🆎")
    }

    /*
     * 当第一个 Observable 发出一个元素时，就立即取出第二个 Observable 中最新的元素，将第一个 Observable 中最新的元素 first 和第二个 Observable 中最新的元素second组合，然后把组合结果 first+second发送出去。
     */
    func operatorUseExample2() {
        let disposeBag = DisposeBag()
        let firstSubject = PublishSubject<String>()
        let secondSubject = PublishSubject<String>()
        
        firstSubject
            .withLatestFrom(secondSubject) {
                (first, second) in
                return first + second
            }
            .subscribe(onNext: { print("output2 = \($0)") })
            .disposed(by: disposeBag)
        
        firstSubject.onNext("🅰️")
        firstSubject.onNext("🅱️")
        secondSubject.onNext("1")
        secondSubject.onNext("2")
        firstSubject.onNext("🆎")
    }

    //MARK: Custom Use
    func operatorUseExample3() {
        let disposeBag = DisposeBag()
        let firstSubject = PublishSubject<String>()
        let secondSubject = PublishSubject<String>()

        firstSubject.withLatestFrom(secondSubject) { (str1, str2) in
            return str1 + str2
            }.subscribe(onNext: {
                print("output3 = \($0)")
            }).disposed(by: disposeBag)
        
            firstSubject.onNext("🅰️")
            firstSubject.onNext("🅱️")
            secondSubject.onNext("1")
            secondSubject.onNext("2")
            firstSubject.onNext("🆎")
        
        }

    func operatorUseExample4() {
        let disposeBag = DisposeBag()
        let firstSubject = PublishSubject<String>()
        let secondSubject = PublishSubject<Bool>()
        
        firstSubject.withLatestFrom(secondSubject) { (str1, value2) in
            return str1.count > 0 && value2
            }.subscribe(onNext: {
                print("output4 = \($0)")
            }).disposed(by: disposeBag)
        
        firstSubject.onNext("🅰️")
        firstSubject.onNext("🅱️")
        secondSubject.onNext(true)
        secondSubject.onNext(false)
        firstSubject.onNext("🆎")
    }

    }


