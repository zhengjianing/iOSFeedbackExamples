//
//  VoiceViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/9/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//


//关于蒲公英SDK

// 蒲公英后台APP管理界面地址：https://www.pgyer.com/manager/dashboard/app/11f1a16e8bd916773bf116b1e479590f
// 蒲公英SDK文档中心：https://www.pgyer.com/doc/view/sdk_ios_guide

//优点:
//摇一摇、语音反馈等功能都挺好用，后台管理界面也比较清晰
//工作人员对于用户提出的ticket，会比较及时的回复
//同时支持iOS和Android，持续更新
//可以实现APP内自动发现和自动更新新的测试版本
//文档还可以

//暂时未解决的问题:（2017-01-10）
//上传：无法通过fastlane从本地上传新版本至蒲公英，只能通过CI配置完成（使用了shenzhen），据说年后会支持
//摇一摇：start之后就stop不了了，这样就不能只在某个页面使用“摇一摇”功能，因为一旦触发就不能停止了
//只有OC版本，没有swift版本，必须桥接


import UIKit

class VoiceViewController: UIViewController {

    @IBOutlet weak var tipsLabel: UILabel!
    
    let PgyAppID = "30f52a342978b5a981f21bd580660f8f"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "摇一摇 & 语音"
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
