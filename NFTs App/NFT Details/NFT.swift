//
//  NFT.swift
//  NFTs App
//
//  Created by Alexandros on 2/5/23.
//

import Foundation

struct NftsResponse: Codable {
    var title_nfts: [String]
    var nfts: [NFT]
    
    enum ArraysKeys: String, CodingKey {
        case title_nfts
        case nfts
    }
    
    init(from decoder: Decoder) throws {
        let ArrayContainer = try decoder.container(keyedBy: ArraysKeys.self)
        
        self.title_nfts = try ArrayContainer.decode([String].self, forKey: .title_nfts)
        self.nfts = try ArrayContainer.decode([NFT].self, forKey: .nfts)
    }
    
    struct NFT: Codable {
        let id: Int?
        let num_sales: Int?
        let image_url: String?
        let name: String?
        let created_date: String?
        let address: String?
        
        enum NftKeys: String, CodingKey {
            case id
            case num_sales
            case image_url
            case name
            case assetContract = "asset_contract"
        }
        
        enum AssetKeys: String, CodingKey {
            case address
            case created_date
        }
        init(from decoder: Decoder) throws{
      
            let NftContainer = try decoder.container(keyedBy: NftKeys.self)
            let AssettContainer = try NftContainer.nestedContainer(keyedBy: AssetKeys.self, forKey: .assetContract)
        
            self.id = try NftContainer.decode(Int.self, forKey: .id)
            self.image_url = try NftContainer.decode(String.self, forKey: .image_url)
            self.name = try NftContainer.decode(String.self, forKey: .name)
            self.num_sales = try NftContainer.decode(Int.self, forKey: .num_sales)
            self.created_date = try AssettContainer.decode(String.self, forKey: .created_date)
            self.address = try AssettContainer.decode(String.self, forKey: .address)
        }
    }
}
