//
//  ViewController.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class ViewController: UIViewController {

	private var closureButton: UIButton = {
		let b = UIButton()
		b.setTitle("Closure Method", for: [])
		b.backgroundColor = .blue
		return b
	}()
	
	private var delegateButton: UIButton = {
		let b = UIButton()
		b.setTitle("Delegate Method", for: [])
		b.backgroundColor = .red
		return b
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		[closureButton, delegateButton].forEach { b in
			b.setTitleColor(.white, for: .normal)
			b.setTitleColor(.lightGray, for: .highlighted)
			// give our button title a little left/right padding
			b.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
		}
		
		let stack = UIStackView()
		stack.axis = .vertical
		stack.spacing = 24
		stack.translatesAutoresizingMaskIntoConstraints = false
		
		stack.addArrangedSubview(closureButton)
		stack.addArrangedSubview(delegateButton)
		view.addSubview(stack)
		
		let g = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			stack.centerXAnchor.constraint(equalTo: g.centerXAnchor),
			stack.centerYAnchor.constraint(equalTo: g.centerYAnchor),
			stack.widthAnchor.constraint(equalTo: g.widthAnchor, multiplier: 0.7)
		])
		
		closureButton.addTarget(self, action: #selector(closureTap(_:)), for: .touchUpInside)
		delegateButton.addTarget(self, action: #selector(delegateTap(_:)), for: .touchUpInside)

	}

	@objc private func closureTap(_ sender: Any?) -> Void {
		let vc = ClosureMethodTableViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc private func delegateTap(_ sender: Any?) -> Void {
		let vc = DelegateMethodTableViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
}

