//
//  DetailViewController.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class DetailViewController: UIViewController {

	public var theData: String = ""
	
	private var theLable: UILabel = {
		let v = UILabel()
		v.numberOfLines = 0
		v.textAlignment = .center
		v.backgroundColor = .cyan
		v.translatesAutoresizingMaskIntoConstraints = false
		return v
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		view.addSubview(theLable)
		
		let g = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			theLable.centerXAnchor.constraint(equalTo: g.centerXAnchor),
			theLable.centerYAnchor.constraint(equalTo: g.centerYAnchor),
			theLable.widthAnchor.constraint(equalTo: g.widthAnchor, multiplier: 0.8),
		])
		
		theLable.text = "\n\nThis is the detail controller for:\n\n\(theData)\n\n"
	}

}
