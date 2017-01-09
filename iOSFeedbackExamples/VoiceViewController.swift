//
//  VoiceViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/9/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class VoiceViewController: UIViewController {

    @IBOutlet weak var tipsLabel: UILabel!

    // 蒲公英后台APP管理界面地址：https://www.pgyer.com/manager/dashboard/app/11f1a16e8bd916773bf116b1e479590f
    // 蒲公英SDK文档中心：https://www.pgyer.com/doc/view/sdk_ios_guide
    
    let PgyAppID = "11f1a16e8bd916773bf116b1e479590f"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "摇一摇 & 语言"
        tipsLabel.text = "可以通过“摇一摇”手机来截屏，并在图上标注，同时支持语音反馈。反馈内容会发送反馈至蒲公英后台。"
        
        //Move this to AppDelegate if you want to make this work globally
        setupPgySDK()
    }
    
    private func setupPgySDK() {
//        下面自定义必须在调用 [[PgyManager sharedPgyManager] startManagerWithAppId:@"PGY_APP_ID"] 前设置。
        
//        关闭用户反馈功能(默认开启)：
//        PgyManager.shared().isFeedbackEnabled = NO
        
//        设置用户反馈界面激活方式为三指拖动
//        PgyManager.shared().feedbackActiveType = .pgyFeedbackActiveTypeThreeFingersPan
//        设置用户反馈界面激活方式为摇一摇(default)
//        PgyManager.shared().feedbackActiveType = .pgyFeedbackActiveTypeShake
//        通过代码激活，在需要绑定事件的方法里调用下面方法即可：
//        PgyManager.shared().showFeedbackView()
        
//        自定义用户界面风格，default:0x37C5A1(绿色)
//        PgyManager.shared().themeColor = UIColor.black
        
        
        PgyManager.shared().start(withAppId: PgyAppID)
        PgyUpdateManager.sharedPgy().start(withAppId: PgyAppID)
        
//        打开检查版本更新功能，蒲公英为开发者提供了检查版本更新的功能，当开启此功能后，开发者如果在蒲公英上提交了新版本，则老的版本中，可以弹出更新提示，来提示用户更新到最新版本。
        PgyUpdateManager.sharedPgy().checkUpdate()
    }

}
