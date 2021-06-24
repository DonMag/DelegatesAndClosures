//
//  DelegateMethodDataSource.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class DelegateMethodDataSource: NSObject, UITableViewDataSource, MyTextChangeDelegate {

	weak var theButtonTapDelegate: MyButtonTapDelegate?

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
		let c = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DelegateMethodTableViewCell
		
		c.packageSizeTextField.text = getValueAtIndex(indexPath)
		
		c.theButtonTapDelegate = self.theButtonTapDelegate
		c.theTextChangeDelegate = self
		
		return c
	}
	
	func cellTextChanged(_ cell: UITableViewCell, str: String) {
		// as the DataSource, we don't have a direct reference to the
		//	tableView, so get it from the cell
		guard let tableView = cell.superview as? UITableView,
			  let indexPath = tableView.indexPath(for: cell)
		else {
			return
		}
		// update our data
		self.setValueAtIndex(str, indexPath: indexPath)
	}

}
