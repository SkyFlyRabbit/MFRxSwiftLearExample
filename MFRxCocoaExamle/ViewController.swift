//
//  ViewController.swift
//  MFRxCocoaExamle
//
//  Created by XuMengFan on 2018/6/9.
//  Copyright © 2018年 MF. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArray: [Dictionary<String, Array<String>>]?
    
    //MARK: life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RxCocoa简单使用范例"
        self.dataArray = [
            ["Observable(被观察者)":["ss"]],
            ["Observable(观察者)":["ss"]],
            ["Operator(操作符)":["withLatestFrom", "combineLatest"]],
            ["Observable&&Observer(既是可被监听的序列也是观察者)":["PublishSubject"]],
            ["使用例子":["UITextField控件使用"]],
                         ]
//        self.dataArray = ["UITextField控件使用", "withLatestFrom", "PublishSubject"]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.sectionHeaderHeight = 30.0
        self.tableView.rowHeight = 50
        self.tableView.tableFooterView = UIView.init()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section < (self.dataArray?.count)! {
            let dic = self.dataArray![section]
            return (dic.values.first?.count)!
        }
        return 0
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.dataArray!.count;
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section < (self.dataArray?.count)! {
            let dic = self.dataArray![section]
            return dic.keys.first
        }
        return ""
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if indexPath.row < (self.dataArray?.count)! {
            let dic = self.dataArray![indexPath.section]
            cell.textLabel?.text = dic.values.first?[indexPath.row]
        }
        return cell;
    }
    
    //MARK: UITableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        var vc: UIViewController?
        switch indexPath.section {
            case 0:
                print("🙄")
            case 1:
                print("🙄")
            case 2://Operator(操作符)
                switch indexPath.row {
                    case 0:
                        vc = Operator__withLatestFrom.init(nibName: nil, bundle: nil)
                    case 1:
                        vc = Operator___combineLatest.init(nibName: nil, bundle: nil)
                    default:
                        print("🙄")
                }
            case 3://Observable&&Observer(既是可被监听的序列也是观察者)
                switch indexPath.row {
                    case 0:
                        vc = Observable__Observer__PublishSubject.init(nibName: nil, bundle: nil)
                    default:
                        print("呵呵")
                }
            default:
                print("🙄")
        }
        if vc != nil {
            self.navigationController?.pushViewController(vc!, animated: true);
        }
    }
}

