//
//  ViewController.swift
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    
    //MARK: - Outlets
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cameraDetailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    

}

