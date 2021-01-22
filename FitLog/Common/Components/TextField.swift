//
//  TextField.swift
//  FitLog
//
//  Created by Danny Prodanovic on 21/01/2021.
//

import UIKit

class TextField: UIControl, UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: .zero)

        textField.delegate = self

        addSubview(textField)
        addSubview(placeHolderLabel)
        addSubview(bottomLine)

        translatesAutoresizingMaskIntoConstraints = false

        setUpContraints()
    }

    private func setUpContraints() {

        NSLayoutConstraint.deactivate(self.constraints)

        let views = ["textField": textField, "bottomLine": bottomLine, "placeHolder": placeHolderLabel]
        NSLayoutConstraint.activate([
        NSLayoutConstraint.init(
            item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        ])

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(0)-[bottomLine]-(0)-|",
            options:[], metrics: nil, views: views)
        )
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(0)-[placeHolder]-(0)-|",
            options:[], metrics: nil, views: views)
        )
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-(0)-[textField]-(0)-|",
            options:[], metrics: nil, views: views)
        )
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
            withVisualFormat: "V:[textField]-(0)-[bottomLine]-(0)-|",
            options:[], metrics: nil, views: views)
        )

        if isEmpty {

            NSLayoutConstraint.activate([
            NSLayoutConstraint.init(
                item: placeHolderLabel, attribute: .centerY, relatedBy: .equal, toItem: textField, attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
        } else {
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(0)-[placeHolder]",
                options:[], metrics: nil, views: views)
            )
        }
    }

    private func updateUI(trigger: Bool = true) {

        bottomLine.isHidden = !isActive
        setUpContraints()
    }

    public var placeHolder: String = "" {
        didSet {
            placeHolderLabel.text = placeHolder
        }
    }

    public var text: String {
        return textField.text ?? ""
    }

    private var isActive: Bool = false {
        didSet {
            updateUI(trigger: oldValue != isActive)
        }
    }

    private var isEmpty: Bool {
        return textField.text?.isEmpty ?? true
    }

    public let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.text = "PlaceHoldertje"
        return label
    }()

    public let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(test), for: .editingChanged)
        return textField
    }()

    @objc private func test() {
        updateUI()
    }

    public let bottomLine = BottomLine()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        isActive = true
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        isActive = false
    }

}

class BottomLine: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)

        isHidden = true
        backgroundColor = UIColor(named: "DPBlue")
        translatesAutoresizingMaskIntoConstraints = false
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0.0, height: 1.0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
