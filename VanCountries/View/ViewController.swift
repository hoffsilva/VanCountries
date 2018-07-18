//
//  ViewController.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let countryViewModel = CountryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        countryViewModel.getAllCountries()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

