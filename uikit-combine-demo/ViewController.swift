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
			// .filter { $0 != "" }
			.map { text in
				return text=="" ? "Please enter something below:" : "Entered: \(text)"
			}
			.receive(on: RunLoop.main)
			.assign(to: \.text, on: outputLabel)
	}
	
}
