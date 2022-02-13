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
	
	@Published var currentText = ""
	var currentTextPublisher: AnyCancellable?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.currentTextPublisher = $currentText
			.map { "Entered: \($0)" }
			.receive(on: RunLoop.main)
			.assign(to: \.text, on: outputLabel)
	}
	
	@IBAction func textEditingChanged(_ sender: Any) {
		if let textField = sender as? UITextField {
			self.currentText = textField.text ?? "-Empty-"
		}
	}
	
}
