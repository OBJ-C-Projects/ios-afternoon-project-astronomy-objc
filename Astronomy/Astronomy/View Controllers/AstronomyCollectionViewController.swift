//
//  AstronomyCollectionViewController.swift
//  Astronomy
//
//  Created by FGT MAC on 5/27/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AstronomyCell"

class AstronomyCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    private var sol: Int = 1000 {
        didSet{
            fetchData()
        }
    }
    private var network = Network()
    private var photosArray: Array<Planet> = [] {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loader(start: true)
        fetchData()
        
    }

    //MARK: - Private Methods
    
    private func updateViews() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.loader(start: false)
        }
    }
    
    func fetchData() {
        network.fetchPlanetsPhoto("", sol: Int32(sol)) { (planet, error) in
            self.photosArray = planet
        }
    }
    
    func loader(start activateLoader: Bool) {
        if(activateLoader){
            loadingIndicator.isHidden = false
            loadingIndicator.startAnimating()
        }else{
            loadingIndicator.isHidden = true
            loadingIndicator.stopAnimating()
        }
    }
    
    //MARK: - Actions
    @IBAction func stepperPressed(_ sender: UIStepper) {
        loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
        sol = Int(sender.value)
    }
    
    //MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PlanetCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let imgData = photosArray[indexPath.row]
        
        // Configure the cell
        if let imageData = try? Data(contentsOf: imgData.imageURL.usingHTTPS!) {
            cell.imageView.image = UIImage(data: imageData)
        }
    
        cell.titleLabel.text = imgData.date
        
        return cell
    }

    //MARK: - Prepare
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailViewSegue" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            
            let selectedPhoto = photosArray[self.collectionView.indexPathsForSelectedItems!.first!.row]
            
            detailVC.photo = selectedPhoto
            
        }
    }

}
