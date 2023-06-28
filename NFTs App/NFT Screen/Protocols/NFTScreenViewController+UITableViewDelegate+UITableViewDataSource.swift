//
//  NFTScreenViewController+UITableViewDelegate+UITableViewDataSource.swift
//  NFTs App
//
//  Created by Alexandros on 8/5/23.
//

import UIKit

extension NFTScreenViewController: UITableViewDelegate, UITableViewDataSource  {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
            switch data[indexPath.row] {
            case .banner(let nfts):
                let imageURLs = nfts.first?.title_nfts.map { $0.image } ?? []
                if let collectionCell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCellIdentifier", for: indexPath) as? CollectionTableViewCell {
                    
                    collectionCell.setup(imageURLs: imageURLs, data: data)
                    return collectionCell
                }
            case .element(let nft):
                guard let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellIdentifier", for: indexPath) as? CustomTableViewCell else {
                    return UITableViewCell()
                }
                customCell.setup(nft)
                return customCell
        }
        return UITableViewCell()
    }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        switch self.data[indexPath.item] {
        case.banner(_):
            return 200
            //return UITableView.automaticDimension
        case.element(_):
            //return UIScreen.main.bounds.width/3
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNFTDetailsStoryboard", sender: self)
    }
    
}
    
