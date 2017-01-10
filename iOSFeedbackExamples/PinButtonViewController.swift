//
//  PinButtonViewController.swift
//  iOSFeedbackExamples
//
//  Created by Guanxiong Cao  on 10/01/2017.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class PinButtonViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let pinBtn = UIButton(type: UIButtonType.system)
    let viewModel = FeedbackViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pin Button"
        setupUI()
    }
    
    private func setupUI() {
        scrollView.contentSize = CGSize(width: 0, height: 1000)
        self.view.addSubview(pinBtn)
        pinBtn.setTitle("PinButton", for: .normal)
        pinBtn.titleLabel?.textColor = UIColor.white
        pinBtn.layer.cornerRadius = 5
        pinBtn.layer.borderColor = UIColor.blue.cgColor
        pinBtn.layer.borderWidth = 1.0
        setupButtonConstraints()
    }
    private func setupButtonConstraints() {
        pinBtn.translatesAutoresizingMaskIntoConstraints = false
        pinBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
        pinBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        pinBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
