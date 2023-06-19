//
//  NFTScreenViewController.swift
//  NFTs App
//
//  Created by Alexandros on 26/4/23.
//

import UIKit


enum TableViewDataEnum {
    case banner(nfts: [NftsResponse])
    case element(nft: NftsResponse.NFT)
}

class NFTScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    var nfts = [NftsResponse]()
    var titleNFTS = [NftsResponse]()
    
    var emptyView: EmptyView?
    
    var data: [TableViewDataEnum] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView?.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView?.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCellIdentifier")
        
        //Styling the table
        tableView?.separatorStyle = .singleLine
        tableView?.separatorColor = .black
        tableView?.showsVerticalScrollIndicator = false
        
        //Set data source and delegate
        tableView?.delegate = self
        tableView?.dataSource = self
       
        downloadJSON {
            self.tableView?.reloadData()
            print("success")
        }
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //prepare me to enum
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? NFTDetailsViewController,
               let indexPath = tableView?.indexPathForSelectedRow {
                if case .element(let nft) = data[indexPath.row] {
                    destination.nft = nft
                }
                }
            }
  
    func downloadJSON(completed: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: "https://public.arx.net/~chris2/nfts1.json") else {
                print("Invalid URL")
                DispatchQueue.main.async {
                    self.showEmptyView(with: "Invalid URL")
                }
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    self.showEmptyView(with: "Unable to fetch JSON data")
                }
                return
            }
            
            guard let nftsResponse = try? JSONDecoder().decode(NftsResponse.self, from: data) else {
                DispatchQueue.main.async {
                    self.showEmptyView(with: "Invalid JSON data")
                }
                return
            }
            
            self.data.removeAll()
            self.nfts.append(nftsResponse) // Emfanizei ola ta customCell apo to JSON me ta enum (5)
            
            self.data.append(.banner(nfts: [nftsResponse]))
            
            for nft in nftsResponse.nfts {
                self.data.append(.element(nft: nft))
            }
            
            DispatchQueue.main.async {
                self.hideEmptyView()
                completed()
            }
        }
    }
    
    func showEmptyView(with message: String) {
        emptyView = EmptyView(delegate: self, message: message)
        view.addSubview(emptyView!)
    }
    
    func hideEmptyView() {
        emptyView?.removeFromSuperview()
        emptyView = nil
    }
}
