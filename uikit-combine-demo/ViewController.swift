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
			.map { notification in
				(notification.object as! UITextField).text ?? ""
			}
			.map { text in
				return text=="" ? "Please enter something below:" : "Entered: \(text)"
			}
			.receive(on: RunLoop.main)
			.assign(to: \.text, on: outputLabel)
	}
	
}
