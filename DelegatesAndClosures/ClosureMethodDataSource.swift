//
//  ClosureMethodDataSource.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class ClosureMethodDataSource: NSObject, UITableViewDataSource {

	public var actionClosure: ((UITableViewCell)->())?
	
	private var myData: [String] = [
		"One",
		"Two",
		"Three",
		"Four",
		"Five",
		"Six",
		"Seven",
		"Eight",
	]
	
	// so we can get data from outside this class
	public func getValueAtIndex(_ indexPath: IndexPath) -> String {
		return myData[indexPath.row]
	}
	
	// so we can set data from outside this class (if desired)
	public func setValueAtIndex(_ str: String, indexPath: IndexPath) -> Void {
		myData[indexPath.row] = str
	}
	
	internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			myData.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myData.count
	}
	internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let c = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClosureMethodTableViewCell
		
		c.packageSizeTextField.text = getValueAtIndex(indexPath)
		
		c.changeClosure = { [weak self, weak tableView] str, cell in
			guard let self = self,
				  let tableView = tableView,
				  let indexPath = tableView.indexPath(for: cell)
			else {
				return
			}
			// update our data
			self.setValueAtIndex(str, indexPath: indexPath)
		}
		
		c.tapClosure = {  [weak self] cell in
			guard let self = self
			else {
				return
			}
			// tell the controller the button in cell a cell was tapped
			self.actionClosure?(cell)
		}
		
		return c
	}

}
