//
//  BlankView.swift
//  NFTs App
//
//  Created by Alexandros on 15/5/23.
//

import UIKit

class BlankView: UIView{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override init(frame: CGRect) { // CustomView in code
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) { // CustomView in InterfaceBuilder
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        //Load the XIB File
        guard let contentView = Bundle.main.loadNibNamed("BlankView", owner: self, options: nil)?.first as? UIView else{
            return
        }
        //let nib = UINib(nibName: "BlankView", bundle: nil)
        //if let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            contentView.frame = bounds
            addSubview(contentView)
            self.contentView = contentView
        //}
    } 
}

