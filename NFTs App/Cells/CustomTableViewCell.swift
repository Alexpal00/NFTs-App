//
//  CustomTableViewCell.swift
//  NFTs App
//
//  Created by Alexandros on 15/5/23.
//
import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - IBPProperties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adresLabel: UILabel!
    @IBOutlet weak var CellImageView : UIImageView!
    
    // MARK: - Properties
    
    //private(set) var nft: NftsResponse.NFT?
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byTruncatingTail
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }


    // MARK: - Methods
    
    func setup(_ nft: NftsResponse.NFT) {
        //self.nft = nft
        
        //nameLabel.text = ""
        //adresLabel.text = ""
        /*
        for nft in nfts {
        nameLabel.text?.append("\(nft.name?.capitalized ?? "")\n")
        adresLabel.text?.append("\(nft.address?.capitalized ?? "")\n")
    }
    */
        nameLabel.text = nft.name?.capitalized
        adresLabel.text = nft.address?.capitalized
        
        if let imgUrl = nft.image_url, let url = URL(string: imgUrl){
            CellImageView.downloaded(from: url)
        }

}
}
