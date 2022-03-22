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
	@IBOutlet weak var inputField: UITextField!
	
	var currentTextPublisher: AnyCancellable?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.currentTextPublisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: inputField)
			.compactMap { ($0.object as? UITextField)?.text }
			.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
			.map { text in
				return text=="" ? "Please enter something below:" : "Entered: \(text)"
			}
			.print()
			.receive(on: RunLoop.main)
			.sink(receiveValue: { text in
				let action = UIAlertAction(title: "OK", style: .default)
				let alert = UIAlertController(title: "Keystrokes", message: text, preferredStyle: .alert)
				alert.addAction(action)
				self.present(alert, animated: true)

				self.outputLabel.text = text
			})
	}

}
