//
//  EmailViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/5/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Email"
    }
    @IBAction func sendEmailAction(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = configuredMailComposeViewController()
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        self.dismiss(animated: true, completion: nil)
        switch result {
        case .cancelled:
            print("cancelled")
            break
        case .saved:
            print("saved")
            break
        case .sent:
            print("sent")
            break
        case .failed:
            print("failed")
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        let systemVersion = UIDevice.current.systemVersion
        let deviceModel = UIDevice.current.model
        mailComposeVC.setToRecipients(["1038875231@qq.com"])
        mailComposeVC.setSubject("提交反馈")
        mailComposeVC.setMessageBody("请填写您的建议, 我们将尽快处理:\n\n\n\n\n\n系统版本：\(systemVersion)\n设备型号：\(deviceModel)", isHTML: false)
        
        return mailComposeVC
    }
    
    func showSendMailErrorAlert() {
        
        let sendMailErrorAlert = UIAlertController(title: "无法发送邮件",
                                                   message: "您的设备尚未设置邮箱，请在“邮件”应用中设置后再尝试发送。",
                                                   preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消", style: .cancel) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        let setting = UIAlertAction(title: "去设置", style: .default) {
            action in
            self.gotoSettingPage()
        }
        sendMailErrorAlert.addAction(cancel)
        sendMailErrorAlert.addAction(setting)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    func gotoSettingPage() {
        let settingUrl = URL(string: UIApplicationOpenSettingsURLString)!
        if UIApplication.shared.canOpenURL(settingUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(settingUrl)
            }
        } else {
            print("can't open url")
        }
    }
}
