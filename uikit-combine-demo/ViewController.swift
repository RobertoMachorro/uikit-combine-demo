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
		// Do any additional setup after loading the view.
	}

	@IBAction func textEditingDidEnd(_ sender: Any) {
	}

	@IBAction func buttonTap(_ sender: Any) {
		let value = textField.text ?? "-Empty-"
		outputLabel.text = "Entered: \(value)"
	}

}

