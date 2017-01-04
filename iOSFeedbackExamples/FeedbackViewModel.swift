//
//  FeedbackViewModel.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/4/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import Foundation

struct FeedbackViewModel {

    let feedbacks = ["feedback1", "feedback2"]
    
    func numberOfRows() -> Int {
        return feedbacks.count
    }
    
    func titleForRow(row: Int) -> String {
        return feedbacks[row]
    }
}
