//
//  RateUsViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/4/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class RateUsViewController: UIViewController {
    
    let rateViewModel = RateUsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func rateAction(_ sender: UIButton) {
        // 提示controller
        let alertController = UIAlertController(title: rateViewModel.alertTitle,
                                                message: rateViewModel.alertMessage,
                                                preferredStyle: .alert)
        // 立即评论
        let rate = UIAlertAction(title: rateViewModel.rateBtnTitle, style: .default) {
            action in
            self.gotoAppStore()
        }
        // 暂不评价
        let later = UIAlertAction(title: rateViewModel.laterBtnTitle, style: .default) {
            action in
            self.todoAction()
        }
        // 不再提醒
        let cancel = UIAlertAction(title: rateViewModel.cancleBtnTitle, style: .cancel) {
            action in
            self.todoAction()
        }
        alertController.addAction(rate)
        alertController.addAction(later)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func gotoAppStore() {
        // 确认手机是否安装目标app
        if let url = URL(string: rateViewModel.qqMailUrl), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            // 没有安装时提示
        } else {
            print("没有安装要打开的应用")
        }
    }
    
    func todoAction() {
        print("暂时没有额外的操作, 将回到刚才的页面")
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        navigationItem.title = rateViewModel.naviTitle
    }
}
