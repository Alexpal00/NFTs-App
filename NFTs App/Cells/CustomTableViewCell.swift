//
//  CustomTableViewCell.swift
//  NFTs App
//
//  Created by Alexandros on 15/5/23.
//

import UIKit

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - IBPProperties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adresLabel: UILabel!
    
    // MARK: - Properties
    
    //private(set) var nft: NftsResponse.NFT?
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
}
}
