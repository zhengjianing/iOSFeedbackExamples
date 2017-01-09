//
//  FeedbackViewModel.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/4/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import Foundation
import UIKit

struct FeedbackViewModel {

    // Format: Cell title, Storyboard name, View Controller name
    let feedbacks = [
        ("Email your feedback", "Email", "EmailViewController"),
        ("Rate us on the AppStore", "RateUs", "RateUsViewController"),
        ("Short Survey", "ShortSurvey", "ShortSurveyViewController"),
        ("Floating Button", "FloatingButton", "FloatingButtonViewController"),
        ("Voice & Shake", "Voice", "VoiceViewController")]
    
    func numberOfRows() -> Int {
        return feedbacks.count
    }
    
    func titleForRow(row: Int) -> String {
        return feedbacks[row].0
    }
    
    func storyboardNameForRow(row: Int) -> String {
        return feedbacks[row].1
    }
    
    func viewControllerIdentifierForRow(row: Int) -> String {
        return feedbacks[row].2
    }
    
}
