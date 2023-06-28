//
//  CollectionTableViewCell.swift
//  NFTs App
//
//  Created by Alexandros on 19/6/23.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    // MARK: - IBPProperties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var imageURLs: [String] = []
    var data: [TableViewDataEnum] = []
   
    // MARK: - Life cycle
    
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
    
    // MARK: - Methods
    
    func setup(imageURLs: [String], data: [TableViewDataEnum]) {
            self.imageURLs = imageURLs
            self.data = data
            collectionView.reloadData()
        }
}

extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //CollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate and return the desired size for each item
        let itemWidth: CGFloat = 200.0
        let itemHeight: CGFloat = 200.0
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    //DataSource methods
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
                            //cell.titleLabel.text = self.getNFT(for: indexPath)?.name ?? "" // Empty String an den mporei na vrei name apo nfts1.json
                            if let nft = self.getNFT(for: indexPath) {
                                                    cell.titleLabel.text = nft.name
                                                } // Lathos mallon
                        }
                    }
                }.resume()
            }
        
        if let nftTitle = getNFT(for: indexPath) {
            cell.nftImage = nftTitle
            cell.titleLabel.text = nftTitle.name
        }
        
        return cell
    }
    
    private func getNFT(for indexPath: IndexPath) -> NftsResponse.NFTTitle? {
            /*
            guard indexPath.row < data.count else {
                return nil
            }
            */
                
        guard let bannerIndex = data.firstIndex(where: {
            if case .banner = $0 {
                return true
            }
            return false
        }) else {
            return nil
        }
        
            /*
            if case let .element(nft) = data[indexPath.row] {
                return nft
            }
            */
            
        if case let .banner(nfts) = data[bannerIndex]  {
                //return nftTitle
            return nfts.first?.title_nfts[indexPath.item]
            }
            
            return nil
        }
     
    }



