//
//  ViewController.swift
//  uikit-combine-demo
//
//  Created by Roberto Machorro on 2/13/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var outputLabel: UILabel!
	@IBOutlet weak var textField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func textEditingChanged(_ sender: Any) {
		let value = textField.text ?? "-Empty-"
		outputLabel.text = "Entered: \(value)"
	}

	@IBAction func buttonTap(_ sender: Any) {
		outputLabel.text = "Starting over."
	}

}
