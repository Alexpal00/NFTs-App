//
//  GreenViewController.swift
//  NFTs App
//
//  Created by Alexandros on 26/4/23.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTaped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToNFTScreenStoryboard", sender: self)
    }
}
