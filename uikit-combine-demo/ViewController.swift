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
	
	@Published var currentText = ""
	var currentTextPublisher: AnyCancellable?

	var logging = PassthroughSubject<String, Never>()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.currentTextPublisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: inputField)
			.sink { notification in
				if let inputField = notification.object as? UITextField {
					print("Value=\(inputField.text ?? "")")
				}
			}
	}
	
}
