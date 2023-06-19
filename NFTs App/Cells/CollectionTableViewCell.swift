//
//  CollectionTableViewCell.swift
//  NFTs App
//
//  Created by Alexandros on 19/6/23.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageURLs: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView?.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        collectionView.collectionViewLayout = layout
    }
    
    func setup(imageURLs: [String]) {
            self.imageURLs = imageURLs
            collectionView.reloadData()
        }
}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        print("Number of items: \(imageURLs.count)")
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
     
        let imageURLString = imageURLs[indexPath.item]

        if let imageURL = URL(string: imageURLString) {
                URLSession.shared.dataTask(with: imageURL) { data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.imageView?.image = image
                        }
                    }
                }.resume()
            }
         return cell
    }
}
