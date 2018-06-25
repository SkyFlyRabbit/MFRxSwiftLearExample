//
//  Operator__ just.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/25.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

/*
 * just
 * 创建 Observable 发出唯一的一个元素
 * just 操作符将某一个元素转换为 Observable
 *
 *
 *
 * 笔记: (1)just创建的Observable不可以改变其中的元素值,或者增减元素(可以与常量做类比)
        (2)just适合于元素值确定唯一,不希望发生变化的情况
 */

class Operator___just: MBaseViewController {

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
        _ = Observable.just(0)
        
        //相当于:
        _ = Observable<Int>.create { observer in
            observer.onNext(0)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    //MARK: Custom Use
    func operatorUseExample2() {
        let disposeBag = DisposeBag()
        
        let observable = Observable.just(0)
        observable.asObservable().subscribe(onNext: {
            print("example1 = \($0)")
        }).disposed(by: disposeBag)
        
        _ = Observable<Int>.create { observer in
            observer.onNext(0)
            observer.onCompleted()
            return Disposables.create()
        }
    }

    func operatorUseExample3() {
    }

}
