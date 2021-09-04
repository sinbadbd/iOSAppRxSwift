//
//  TopPackView.swift
//  DTAC
//
//  Created by Imran Mia on 2/9/21.
//

import UIKit

public class TopPackView: UIView {
    
    
    var packColorView : UIView?
    var titleLbl      : UILabel?
    var detailsLbl    : UILabel?
    var dataAmntLbl   : UILabel?
    var vatAmntLvl    : UILabel?
    var exclVatLvl    : UILabel?
    var strikeAmntLbl : UILabel?
    
    
    var topPack : PartnerPartner?
    
     override init(frame: CGRect) {
        super.init(frame: frame)
 
        //setupTopPackUI()
    }
  
    
    func setupTopPackUI() -> UIView {
 
        packColorView = UIView()
        addSubview(packColorView!)
        packColorView?.fitToSuper()
        packColorView?.roundCornersAll([.topLeft,.topRight], radius: 8)

        let packStackView = packColorView?.VStack(spacing: 10)
        packStackView?.fitToSuper(insets: .init(top: 16, left: 16, bottom:10, right: 16))
        titleLbl = UILabel()
        titleLbl?.text = "pack_title".localized()
        titleLbl?.font = UIFont.font(ofSize: 14, style: .bold)
        titleLbl?.numberOfLines = 0

        packStackView?.addArrangedSubview(titleLbl!)

        packStackView?.addArrangedSubview(dataPackView())


        detailsLbl = UILabel()
        detailsLbl?.text = "pack_details".localized()
        detailsLbl?.font = UIFont.font(ofSize: 14, style: .regular)
        detailsLbl?.numberOfLines = 0
        packStackView?.addArrangedSubview(detailsLbl!)

         return packColorView!
        //        stackView?.addArrangedSubview(topPackView!)
    }
    
    func dataPackView()->UIView{
        let dataView = UIView()
        
        dataAmntLbl = UILabel()
        dataAmntLbl?.text = "data_amount".localized()
        dataAmntLbl?.font = UIFont.font(ofSize: 44, style: .bold)
        dataView.addSubview(dataAmntLbl!)
        dataAmntLbl?.position(top: dataView.topAnchor, left: dataView.leadingAnchor, bottom: dataView.bottomAnchor, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        strikeAmntLbl = UILabel()
        strikeAmntLbl?.attributedText = "strike_amount".localized().strikeThrough()
        strikeAmntLbl?.font = UIFont.font(ofSize: 14, style: .regular)
        strikeAmntLbl?.numberOfLines = 0
        dataView.addSubview(strikeAmntLbl!)
        strikeAmntLbl?.position(top: dataView.topAnchor, left: dataAmntLbl?.trailingAnchor, insets: .init(top: 0, left: 4, bottom: 0, right: 0))
        
        vatAmntLvl = UILabel()
        vatAmntLvl?.text = "baht_amount".localized()
        vatAmntLvl?.font = UIFont.boldSystemFont(ofSize: 14)
        dataView.addSubview(vatAmntLvl!)
        vatAmntLvl?.position(top: strikeAmntLbl?.bottomAnchor, left: dataAmntLbl?.trailingAnchor, insets: .init(top: 10, left: 4, bottom: 0, right: 0))
        
        
        exclVatLvl = UILabel()
        exclVatLvl?.text = "(\("excl_vat".localized()))"
        exclVatLvl?.font = UIFont.font(ofSize: 14, style: .regular)
        dataView.addSubview(exclVatLvl!)
        exclVatLvl?.position(top: strikeAmntLbl?.bottomAnchor, left: vatAmntLvl?.trailingAnchor, insets: .init(top: 10, left: 4, bottom: 0, right: 0))
        
        return dataView
    }

    func updateTextColor(colorType: String){

        let labelColors = [titleLbl,detailsLbl,dataAmntLbl,strikeAmntLbl,vatAmntLvl,exclVatLvl]
        let type = colorType
        if  type == "only_you" ||  type == "2x_speed" || type == "free_bonus" || type == "data" {

            labelColors.forEach {
                $0?.textColor = UIColor.white
            }
        }else if  type == "test"  {
            titleLbl?.textColor = UIColor.text
            detailsLbl?.textColor = UIColor.text
            dataAmntLbl?.textColor = UIColor.primaryDark
            strikeAmntLbl?.textColor = UIColor.grayDark
            exclVatLvl?.textColor = UIColor.darkGray
            vatAmntLvl?.textColor = UIColor.primaryDark
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
