//
//  ViewController.swift
//  DarkMode
//
//  Created by Cristian Rojas on 01/08/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    var isDarkMode = false
    let defaults = UserDefaults.standard
    let bgColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
    let prefersDarkMode = "prefersDarkmode"
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForStylePreference()
        // Do any additional setup after loading the view.
    }

    @IBAction func didChangeStyleSegmentedControl(_ sender: Any) {
        isDarkMode = (sender as AnyObject).selectedSegmentIndex == 1
        defaults.set(isDarkMode, forKey: prefersDarkMode)
        view.backgroundColor = isDarkMode ? bgColor : .white
    }

    
    func checkForStylePreference() {
        let prefersDarkMode = defaults.bool(forKey: self.prefersDarkMode)
        if prefersDarkMode {
            isDarkMode = true
            view.backgroundColor = isDarkMode ? bgColor : .white
            styleSegmentedControl.selectedSegmentIndex = 1
        }
    }
}

