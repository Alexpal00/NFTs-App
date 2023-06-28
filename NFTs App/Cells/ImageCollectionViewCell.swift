//
//  ImageCollectionViewCell.swift
//  NFTs App
//
//  Created by Alexandros on 19/6/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBPProperties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var nftImage: NftsResponse.NFTTitle? {
        didSet {
            titleLabel.text = nftImage?.image
        }
    }
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
    }
    
    // MARK: - Methods
    
    func setImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }.resume()
    }

}
