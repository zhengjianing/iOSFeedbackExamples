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

    let feedbacks = [("Rate Us", "RateUsStoryboard", "RateUsViewController")]
    
    func numberOfRows() -> Int {
        return feedbacks.count
    }
    
    func titleForRow(row: Int) -> String {
        return feedbacks[row].0
    }
    
    func tagetVCForRow(row: Int) -> UIViewController {
        return UIStoryboard(name: feedbacks[row].1, bundle: nil).instantiateViewController(withIdentifier: feedbacks[row].2)
    }
}
