//
//  PresentationDetailViewController.swift
//  TechDay
//
//  Created by Mustafa Ali Akçakır on 01/03/2019.
//  Copyright © 2019 Mustafa Ali Akçakır. All rights reserved.
//

import UIKit

class PresentationDetailViewController: UIViewController {

	@IBOutlet weak var presenterLabel: UILabel!
	@IBOutlet weak var teamLabel: UILabel!
	@IBOutlet weak var topicLabel: UILabel!
	@IBOutlet weak var timeLabel: UILabel!

	var presentation: Presentation?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = presentation?.topic

		presenterLabel.text = presentation?.presenter
		teamLabel.text = presentation?.team
		topicLabel.text = presentation?.topic
		timeLabel.text = presentation?.time
    }
}
