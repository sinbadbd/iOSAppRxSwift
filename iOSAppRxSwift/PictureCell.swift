//
//  PictureCell.swift
//  iOSAppRxSwift
//
//  Created by Imran Mia on 3/9/21.
//

import UIKit


class PictureCell: UITableViewCell {
 
    public static let reuseIdentifier = "PackViewListCell"
    
    let picImage = UIImageView()
    let lblText = UILabel()
    
    
    
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(picImage)
        picImage.position(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, insets: .init(top: 10, left: 10, bottom: 10, right: 0))
        picImage.backgroundColor = .red
//        picImage.contentMode = .scaleAspectFit
        picImage.size(width:100,height: 100)
        addSubview(lblText)
        lblText.position(top: topAnchor, left: picImage.trailingAnchor, bottom: bottomAnchor, right: trailingAnchor, insets: .init(top: 10, left: 10, bottom: 0, right: 10))
        lblText.text = "dsf"
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
