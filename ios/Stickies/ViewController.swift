//
//  ViewController.swift
//  Stickies
//
//  Created by Stefan on 10/1/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: -
    // MARK: Properties

    @IBOutlet weak var createStickyButton: UIBarButtonItem!

    @IBOutlet weak var stickyLabel: UILabel!

    // MARK: -
    // MARK: Public Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        createStickyButton.accessibilityIdentifier = "createStickyButton"
    }

    // MARK: -
    // MARK: Actions

    @IBAction func didSelectCreateStickyButton(_ sender: UIBarButtonItem) {
        var createStickyInputField: UITextField?
        let alertController = UIAlertController(
            title: "New Sticky Note",
            message: "Enter some text for your new sticky note.",
            preferredStyle: .alert)
        alertController.addTextField { (textField) in
            // Capture a reference to the input text field
            createStickyInputField = textField
            // Allows the UI test to be able to enter into the text field
            textField.accessibilityIdentifier = "stickyTextInput"
        }
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            self.stickyLabel.text = createStickyInputField?.text
        }
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }

}

