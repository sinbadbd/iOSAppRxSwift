//
//  PackDetailView.swift
//  DTAC
//
//  Created by Imran Mia on 2/9/21.
//

import UIKit
import CoreKit

public class PackDetailView: UIView {
    
    var packDataListArr: [PackageDataModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        packDataListArr = [PackageDataModel.init(image: "ic_internet", text: "2GB Youtube", validity: "Max speed"),
                           PackageDataModel.init(image: "ic_calls", text: "Free use of Facebook, Facebook messenger,Line, Twitter and Instagram", validity: ""),
                           PackageDataModel.init(image: "ic_package", text: "2GB Youtube", validity: "2GB Youtube"),
                           
        ]
        
        
        
        addPackageView()
    }
    
    
    func addPackageView(){
        let packView = UIView()
        addSubview(packView)
        packView.fitToSuper()
        //packView.size( heightPriority: 250)
        let packStackView = packView.VStack(spacing: 8)
        packStackView.fitToSuper()
        packStackView.padding([.left,.right,.top], amount: CGFloat(16))
        
        for item in packDataListArr {
            packStackView.addArrangedSubview(packageRows(icon: item.image, daysTitle: item.days, validity: item.validity))
        }
        
    }
    
    func packageRows (icon:String,daysTitle:String,validity:String) -> UIView {
        let packsRowView = UIView()
        
        let packIcon = UIImageView()
        let packLbl = UILabel()
        
        
        packsRowView.addSubview(packIcon)
        packIcon.position(top: packsRowView.topAnchor, left: packsRowView.leadingAnchor, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        packIcon.size(width:14,height: 14)
        packIcon.image = UIImage(named: icon)
        
        packsRowView.addSubview(packLbl)
        packLbl.position(top: packsRowView.topAnchor,left:packIcon.trailingAnchor,bottom: packsRowView.bottomAnchor ,right: packsRowView.trailingAnchor, insets: .init(top: 0, left: 10, bottom: 0, right: 0))
        
        let daysText = getAttributedText(string: "\(daysTitle)", font: UIFont.boldSystemFont(ofSize: 14), color: UIColor.init(hex: "#767676"), lineSpace: 0, alignment: .left)
        let validityText = getAttributedText(string: " \(validity)", font: UIFont.systemFont(ofSize: 14), color: UIColor.init(hex: "#767676"), lineSpace: 0, alignment: .left)
        daysText.append(validityText)
        packLbl.attributedText = daysText
        packLbl.numberOfLines = 0
        
        return packsRowView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

