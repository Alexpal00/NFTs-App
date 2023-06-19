//
//  NFTViewController.swift
//  NFTs App
//
//  Created by Alexandros on 2/5/23.
//

import UIKit

class NFTDetailsViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var creationdateLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var numsalesLbl: UILabel!
    @IBOutlet weak var nftImg: UIImageView!
    
    var nft: NftsResponse.NFT?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nftObject = nft {
            nameLbl.text = nftObject.name
            creationdateLbl.text = nftObject.created_date
            idLbl.text = "\(nftObject.id ?? 0)"
            numsalesLbl.text = "\(nftObject.num_sales ?? 0)"
            
            if let imgUrl = nftObject.image_url, let url = URL(string: imgUrl){
                nftImg.downloaded(from: url)
            }
        }
    }
}
