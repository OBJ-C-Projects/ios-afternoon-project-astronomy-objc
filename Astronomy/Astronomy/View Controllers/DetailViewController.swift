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
    var photo: Planet?
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cameraDetailLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        dateLabel.text = "Taken on \(photo!.date)"
        if let imageData = try? Data(contentsOf: photo!.imageURL.usingHTTPS!){
            
            imageView.image = UIImage(data: imageData)
        }
    }
    
    //MARK: - Actions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        print("Save button pressed!")
    }
    

}

