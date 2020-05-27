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
    //private var network = Network()
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cameraDetailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //network.fetchPlanetsData()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    

}

