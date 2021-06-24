//
//  ClosureMethodTableViewController.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class ClosureMethodTableViewController: UITableViewController {

	lazy var myTableViewDataSource: ClosureMethodDataSource = {
		ClosureMethodDataSource()
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		self.title = "Closure Method"
		
		tableView.register(ClosureMethodTableViewCell.self, forCellReuseIdentifier: "cell")
		
		myTableViewDataSource.actionClosure = { [weak self] cell in
			guard let self = self,
				  let indexPath = self.tableView.indexPath(for: cell)
			else {
				return
			}
			let str = self.myTableViewDataSource.getValueAtIndex(indexPath)
			let vc = DetailViewController()
			vc.theData = str
			self.navigationController?.pushViewController(vc, animated: true)
		}
		
		tableView.dataSource = myTableViewDataSource
	}
	
}
