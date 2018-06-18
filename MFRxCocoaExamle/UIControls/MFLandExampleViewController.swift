//
//  MFLandExampleViewController.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/18.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class MFLandExampleViewController: UIViewController {

    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    

    //MARK: life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindingUIEvent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //MARK: binding UI Event
    func bindingUIEvent() {
        let viewModel = MFLandExampleViewModel.init(input: (self.accountTextField.rx.text.orEmpty.asDriver(), button: self.registerButton.rx.tap.asDriver()))
        viewModel.accountValidInput.drive(self.accountTextField.rx.text)
        viewModel.registerButtonEnabled.drive(self.registerButton.rx.isEnabled)
        viewModel.loginResult.drive(onNext: { result in
            switch result
            {
            case let .Success(message):
                print("成功 = \(message)")
            case let .Faile(message):
                    print("失败 = \(message)")
            default:
                print("请求无结果")
            }
        })
    }

}

class MFLandExampleViewModel: NSObject {
    let accountValidInput: Driver<String>
    let registerButtonEnabled: Driver<Bool>
    let loginResult: Driver<MFLandResult>
    
    init(input:(textField: Driver<String>, button: Driver<Void>)) {
        accountValidInput = input.textField.map({
            $0 + "c"
        })
        registerButtonEnabled = input.textField.map({
            $0.count > 11
        })
//        UIButton.init().rx.tap
        let land = MFLand()
        loginResult = input.button.withLatestFrom(accountValidInput).flatMapLatest({str in
            return land.land(input: str).asDriver(onErrorJustReturn: MFLandResult.Success(message: "登陆成功!!!"))
        })
    }
    
}

enum MFLandResult{
    case Success(message: String)
    case Faile(message: String)
}

class MFLand: NSObject {
    func land(input: String) -> Observable<MFLandResult> {
        return Observable.create({ oberver -> Disposable in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                oberver.onNext(MFLandResult.Success(message: "成功啦!!!"))
            }
            return Disposables.create()
        })
    }
}
