//
//  PresentationsTableViewController.swift
//  TechDay
//
//  Created by Mustafa Ali Akçakır on 01/03/2019.
//  Copyright © 2019 Mustafa Ali Akçakır. All rights reserved.
//

import UIKit

typealias Presentation = (presenter: String, topic: String?, team: String?, time: String)

class PresentationsTableViewController: UITableViewController {
	
	private enum Const {
		static let cellIdentifier = "PresentationCell"
	}
	
	private var presentations: [Presentation] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Tech-Day 2"
		tableView.tableFooterView = UIView()
		navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)

		preparePresenters()
	}
}

// MARK: - Helpers

private extension PresentationsTableViewController {

	func preparePresenters() {
		presentations = [Presentation(presenter: "Aydoğan Ovat", topic: "SIEM with Splunk", team: "InfoSec", time: "14:00 - 14:30"),
						 Presentation(presenter: "Sinan Alyürük", topic: "MySQL 5.7 Migration", team: "Gondor", time: "14:30 - 15:00"),
						 Presentation(presenter: "Coffee Break", topic: nil, team: nil, time: "15:00 - 15:15"),
						 Presentation(presenter: "Mustafa Ali Akçakır", topic: "iOS 101", team: "YODA", time: "15:15 - 15:45"),
						 Presentation(presenter: "Oğuz Yarımtepe", topic: "GittiGidiyor Kubernetes Altyapısı", team: "Dark Side", time: "15:45 - 16:15")]
	}
}

// MARK: - UITableViewDataSource

extension PresentationsTableViewController {
	
	override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
		return presentations.count
	}
	
	override func tableView(_ tableView: UITableView,
							cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier)
		if cell == nil {
			cell = UITableViewCell(style: .subtitle, reuseIdentifier: Const.cellIdentifier)
			cell?.selectionStyle = .none
			cell?.accessoryType = .disclosureIndicator
		}
		
		let presentation = presentations[indexPath.row]

		var detail = presentation.time
		if let topic = presentation.topic {
			detail += " - " + topic
		}

		cell?.textLabel?.text = presentation.presenter
		cell?.detailTextLabel?.text = detail
		
		return cell ?? UITableViewCell()
	}
}

extension PresentationsTableViewController {

	override func tableView(_ tableView: UITableView,
							didSelectRowAt indexPath: IndexPath) {
		let presentation = presentations[indexPath.row]
		guard let _ = presentation.topic else {
			return
		}

		let viewController = PresentationDetailViewController()
		viewController.presentation = presentation
		navigationController?.pushViewController(viewController, animated: true)
	}
}
