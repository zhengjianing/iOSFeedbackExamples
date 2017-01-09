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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if MFMailComposeViewController.canSendMail() {
            // 注意这个实例要写在if block里，
            // 否则无法发送邮件时会出现两次提示弹窗（一次是系统的）
            let mailComposeViewController = configuredMailComposeViewController()
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    // delegate
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        self.dismiss(animated: true, completion: nil)
        _ = self.navigationController?.popToRootViewController(animated: true)
    }

    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        // 获取系统版本号
        let systemVersion = UIDevice.current.systemVersion
        // 获取设备的型号
        let deviceModel = UIDevice.current.model
        // 设置收件地址
        mailComposeVC.setToRecipients(["1038875231@qq.com"])
        // 设置邮件主题
        mailComposeVC.setSubject("提交反馈")
        // 设置邮件正文
        mailComposeVC.setMessageBody("请填写您的建议, 我们将尽快处理:\n\n\n\n\n\n系统版本：\(systemVersion)\n设备型号：\(deviceModel)", isHTML: false)
        
        return mailComposeVC
    }
    // 用户没有设置自己邮箱时
    func showSendMailErrorAlert() {
        
        let sendMailErrorAlert = UIAlertController(title: "无法发送邮件",
                                                   message: "您的设备尚未设置邮箱，请在“邮件”应用中设置后再尝试发送。",
                                                   preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: "取消", style: .cancel) {
            _ in
            _ = self.navigationController?.popToRootViewController(animated: true)
        })
        sendMailErrorAlert.addAction(UIAlertAction(title: "去设置", style: .default) {
            _ in
            self.gotoSettingPage()
        })
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    func gotoSettingPage() {
        // 跳转icloud设置页面
        let settingUrl = URL(string: UIApplicationOpenSettingsURLString)!
        if UIApplication.shared.canOpenURL(settingUrl) {
            UIApplication.shared.openURL(settingUrl)
        } else {
            print("can't open url")
        }
    }
}
// 设备型号deviceModel只能获知设备的简单区分（如是iPhone还是iPad
// 如果需要详细的iOS设备信息，写一个UIDevice的扩展
public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}
