//
//  RateUsViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/4/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class RateUsViewController: UIViewController {
    
    let feedbackViewModel = FeedbackViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 提示controller
        let alertController = UIAlertController(title: feedbackViewModel.feedbacks[1].0,
                                                message: "Any kinds of advice is appreciated",
                                                preferredStyle: .alert)
        // 立即评论
        let rate = UIAlertAction(title: "Rate AppStore", style: .default) {
            action in
            self.gotoAppStore()
        }
        // 暂不评价
        let later = UIAlertAction(title: "Remind me later", style: .default) {
            action in
            self.todoAction()
        }
        // 不再提醒
        let cancel = UIAlertAction(title: "No,Thanks", style: .cancel) {
            action in
            self.todoAction()
        }
        alertController.addAction(rate)
        alertController.addAction(later)
        alertController.addAction(cancel)
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    func gotoAppStore() {
        // QQ邮箱评论页
        let url = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=473225145"
        // 确认手机是否安装将要打开的app
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            // 没有安装时跳转appStore下载界面
        } else {
            let appString = "https://itunes.apple.com/cn/app/id473225145?mt=8"
            let appUrl = URL(string: appString)
            print(appUrl ?? "打开本app在appStore中的下载页面")
        }
    }
    
    func todoAction() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        navigationItem.title = "Rate Us"
    }
}

