//
//  Observable&&Observer--PublishSubject.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/18.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class Observable__Observer__PublishSubject: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.useExample1()
        self.useExample2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func useExample1() {
        let disposeBag = DisposeBag()
        let subject = PublishSubject<String>()
        
        subject
            .subscribe { print("1 Subscription: 1 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🐶")
        subject.onNext("🐱")
        
        subject
            .subscribe { print("1 Subscription: 2 Event:", $0) }
            .disposed(by: disposeBag)
        
        subject.onNext("🅰️")
        subject.onNext("🅱️")
    }

    func useExample2() {
        let disposeBag = DisposeBag()
        let subject = PublishSubject<String>()

        subject.subscribe{
            print("11 result = ", $0)
        }.disposed(by: disposeBag)
        
        subject.onNext("🐘")
        subject.onNext("🦁")

        subject.subscribe{
            print("22 result = ", $0)
            }.disposed(by: disposeBag)
        
        subject.onNext("🐂")
        subject.onNext("🐬")
    }

}
