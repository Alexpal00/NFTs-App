//
//  EmptyView.swift
//  NFTs App
//
//  Created by Alexandros on 4/5/23.
//

import Foundation
import UIKit

class EmptyView: UIView{
    
    init(delegate: UIViewController, message: String){
        super.init(frame: delegate.view.frame)
        
        self.backgroundColor = UIColor.red
        
        let label = UILabel(frame: CGRect(x: 20, y: delegate.view.safeAreaInsets.top + 20, width: delegate.view.frame.width - 40, height: 44))
        label.textColor = UIColor.black
        label.text = message
        
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) hasn't been implemented")
    }
}

