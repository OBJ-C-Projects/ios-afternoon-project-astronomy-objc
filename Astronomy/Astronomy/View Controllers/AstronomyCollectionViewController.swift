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
    private var network = Network()
    private var photosArray: Array<Planet> = [] {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        
        network.fetchPlanetsPhoto("") { (planet, error) in
            self.photosArray = planet
        }
        
        
        
    }

    //MARK: - Private Methods
    
    private func updateViews() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.loadingIndicator.isHidden = true
        }
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
