//
//  DelegateMethodTableViewController.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class DelegateMethodTableViewController: UITableViewController, MyButtonTapDelegate {

	lazy var myTableViewDataSource: DelegateMethodDataSource = {
		DelegateMethodDataSource()
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		self.title = "Delegate Method"
		
		tableView.register(DelegateMethodTableViewCell.self, forCellReuseIdentifier: "cell")

		myTableViewDataSource.theButtonTapDelegate = self
		tableView.dataSource = myTableViewDataSource
	}

	func cellButtonTapped(_ cell: UITableViewCell) {
		guard let indexPath = self.tableView.indexPath(for: cell)
		else {
			return
		}
		let str = self.myTableViewDataSource.getValueAtIndex(indexPath)
		let vc = DetailViewController()
		vc.theData = str
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
}
