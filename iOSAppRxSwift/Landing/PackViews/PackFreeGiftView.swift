//
//  PackFreeGiftView.swift
//  DTAC
//
//  Created by Imran Mia on 2/9/21.
//

import UIKit

public class PackFreeGiftView: UIView {
    
    var giftView : UIView?
 
    var freeGifListArr: [PackageDataModel] = []
    var topPack : PartnerPartner?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      
        freeGifListArr = [
            PackageDataModel.init(image: "ic-game", text: "No data use when playing Free fire, ROV, Pub G, Speed drifter, call of duty", validity: ""),
            PackageDataModel.init(image: "ic-social-entertain", text: "No data use when playing Free fire, ROV, Pub G, Speed drifter, call of duty", validity: ""),
            PackageDataModel.init(image: "ic-roaming", text: "5GB roaming (Asia - USA - Australia)", validity: ""),
//            PackageDataModel.init(image: "ic-calls", text: "Extra Voice 200 mins", validity: ""),
//            PackageDataModel.init(image: "ic-callmeVDO", text: "Free Call Me Video subscription and more!", validity: ""),
//            PackageDataModel.init(image: "ic-cardic-sim", text: "4 Free SIM with 50GB unlimited/sim", validity: ""),
            
        ]
        
    }
    
    
    func addGiftView()-> UIView{ //
        giftView = UIView()
//        giftView?.fitToSuper()
        let giftStackView = giftView?.VStack(spacing: 14)
        giftStackView?.fitToSuper()
        giftStackView?.padding([.left,.right], amount: 16)
        
        let giftTitle = UILabel()
        giftTitle.text = "you_can_choose".localized()
        giftTitle.font = UIFont.font(ofSize: 14, style: .regular)
        giftTitle.textAlignment = .left
        giftTitle.textColor = .grayDark
        giftTitle.numberOfLines = 0
        giftStackView?.addArrangedSubview(giftTitle)
        
        for item in freeGifListArr {
            
            giftStackView?.addArrangedSubview(getGiftRow(icon: item.image, daysTitle: item.days))
        }
        
        
        let goToGifttPageButton = UIButton()
        goToGifttPageButton.setTitleColor(.primaryDark, for: .normal)
        goToGifttPageButton.setTitle("go_to_gift_page".localized(), for: .normal)
        goToGifttPageButton.titleLabel?.font = UIFont.font(ofSize: 14, style: .bold)
        goToGifttPageButton.layer.cornerRadius = 4
        goToGifttPageButton.underline()
        goToGifttPageButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)

        giftStackView?.addArrangedSubview(goToGifttPageButton)
        return giftView!
        
    }
    
    func getGiftRow(icon:String,daysTitle:String) -> UIView {
        let giftRowView = UIView()
        
        let giftIcon = UIImageView()
        let giftLbl = UILabel()
        
        giftRowView.addSubview(giftIcon)
        giftIcon.position(top: giftRowView.topAnchor, left: giftRowView.leadingAnchor, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        giftIcon.size(width:16,height: 16)
        giftIcon.image = UIImage(named: icon)
        
        giftRowView.addSubview(giftLbl)
        giftLbl.position(top: giftRowView.topAnchor,left:giftIcon.trailingAnchor,bottom: giftRowView.bottomAnchor ,right: giftRowView.trailingAnchor, insets: .init(top: 0, left: 8, bottom: 0, right: 0))
        giftLbl.text = "\(daysTitle)"
        giftLbl.font = .font(name: .kanitLight, fontSize:14)
        giftLbl.textColor = UIColor.grayDark
        giftLbl.numberOfLines = 0
        
        return giftRowView
    }
    
    
    @objc func tappedButton(){
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
