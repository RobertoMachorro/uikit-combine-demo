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
		
		self.updateSubscription = $currentText
			.map { "Entered: \($0)" }
			.receive(on: RunLoop.main)
			.assign(to: \.text, on: outputLabel)
	}
	
	@IBAction func textEditingChanged(_ sender: Any) {
		self.currentText = textField.text ?? "-Empty-"
	}
	
	@IBAction func buttonTap(_ sender: Any) {
		self.currentText = "Starting over."
	}
	
}
