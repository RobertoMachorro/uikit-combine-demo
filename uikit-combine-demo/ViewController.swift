//
//  ViewController.swift
//  uikit-combine-demo
//
//  Created by Roberto Machorro on 2/13/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

	@IBOutlet weak var outputLabel: UILabel!
	@IBOutlet weak var textField: UITextField!

	@Published var currentText = ""
	var updateSubscription: AnyCancellable?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.updateSubscription = $currentText.sink {
			print("Updated text: \($0)")
		}
	}

	@IBAction func textEditingChanged(_ sender: Any) {
		self.currentText = textField.text ?? "-Empty-"
	}

	@IBAction func buttonTap(_ sender: Any) {
		self.currentText = "Starting over."
	}

}
