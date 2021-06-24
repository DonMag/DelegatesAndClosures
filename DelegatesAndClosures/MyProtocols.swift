//
//  MyProtocols.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

protocol MyTextChangeDelegate: AnyObject {
	func cellTextChanged(_ cell: UITableViewCell, str: String)
}

protocol MyButtonTapDelegate: AnyObject {
	func cellButtonTapped(_ cell: UITableViewCell)
}

