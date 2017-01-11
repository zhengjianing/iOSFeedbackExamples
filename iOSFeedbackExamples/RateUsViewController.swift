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
        let alertController = UIAlertController(title: rateViewModel.alertTitle,
                                                message: rateViewModel.alertMessage,
                                                preferredStyle: .alert)
        let rate = UIAlertAction(title: rateViewModel.rateBtnTitle, style: .default) {
            action in
            self.gotoAppStore()
        }
        let later = UIAlertAction(title: rateViewModel.laterBtnTitle, style: .default) {
            action in
            self.todoAction()
        }
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
        if let url = URL(string: rateViewModel.qqMailUrl), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
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
