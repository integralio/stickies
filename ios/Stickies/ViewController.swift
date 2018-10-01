//
//  ViewController.swift
//  Stickies
//
//  Created by Stefan on 10/1/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var createStickyButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        createStickyButton.accessibilityIdentifier = "createStickyButton"
    }


}

