//
//  DelegateMethodTableViewCell.swift
//  DelegatesAndClosures
//
//  Created by Don Mag on 6/24/21.
//

import UIKit

class DelegateMethodTableViewCell: UITableViewCell, UITextFieldDelegate {

	weak var theTextChangeDelegate: MyTextChangeDelegate?
	weak var theButtonTapDelegate: MyButtonTapDelegate?
	
	private var testButton: UIButton = {
		let b = UIButton()
		b.setTitle("Details", for: [])
		b.backgroundColor = .red
		b.setTitleColor(.white, for: .normal)
		b.setTitleColor(.lightGray, for: .highlighted)
		// give our button title a little left/right padding
		b.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
		return b
	}()
	public var packageSizeTextField: UITextField = {
		let v = UITextField()
		v.borderStyle = .roundedRect
		return v
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureCell()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configureCell()
	}
	private func configureCell() {
		// configureCell...
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.spacing = 12
		stack.translatesAutoresizingMaskIntoConstraints = false
		
		stack.addArrangedSubview(packageSizeTextField)
		stack.addArrangedSubview(testButton)
		
		contentView.addSubview(stack)
		
		let g = contentView.layoutMarginsGuide
		NSLayoutConstraint.activate([
			stack.topAnchor.constraint(equalTo: g.topAnchor),
			stack.leadingAnchor.constraint(equalTo: g.leadingAnchor),
			stack.trailingAnchor.constraint(equalTo: g.trailingAnchor),
			stack.bottomAnchor.constraint(equalTo: g.bottomAnchor),
		])
		
		// text field delegate, to catch end editing
		packageSizeTextField.delegate = self
		
		// action for text change
		packageSizeTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
		
		// action for button tap
		testButton.addTarget(self, action: #selector(buttonTap(_:)), for: .touchUpInside)
	}
	
	@objc private func buttonTap(_ sender: Any?) -> Void {
		self.endEditing(true)
		// inform the delegate that our button was tapped
		theButtonTapDelegate?.cellButtonTapped(self)
	}
	
	@objc private func textChanged(_ v: UITextField) -> Void {
		// inform the delegate that our text was changed
		theTextChangeDelegate?.cellTextChanged(self, str: v.text ?? "")
	}
	// text can change via autofill without triggering .editingChanged
	internal func textFieldDidEndEditing(_ textField: UITextField) {
		// inform the delegate that our text was changed
		theTextChangeDelegate?.cellTextChanged(self, str: textField.text ?? "")
	}
	
}
