//
//  FloatingButtonViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/5/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class FloatingButtonViewController: UIViewController {
    @IBOutlet weak var backgroundTextLabel: UILabel!

    @IBOutlet weak var feedbackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Floating Button"
        backgroundTextLabel.text = "Be careful when decide to use floating button as the feedback entry. Make sure only use it temporarily for new/important features and it could be turned off by server side at any time."
        
        
    }

    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        
            if let view = recognizer.view {
                view.center = CGPoint(x:view.center.x + translation.x,
                                      y:view.center.y + translation.y)

            }
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        
    }
}
