//
//  ViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/4/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class FeedbackTableViewController: UITableViewController {

    let feedbackViewModel = FeedbackViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbackViewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell", for: indexPath)
        cell.textLabel?.text = feedbackViewModel.titleForRow(row: indexPath.row)
        return cell
    }

}

