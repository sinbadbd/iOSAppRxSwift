//
//  PackViewListCell.swift
//  PackViewListCell
//
//  Created by Imran on 20/8/21.


import UIKit
import CoreKit
import ViewKit

protocol PackListsDelegates {
    func indexItemReload(cell: PackViewListCell, isGiftHidden:Bool)
    func getButtonPressed(pack : PartnerPartner?)
}
enum SimCategoryType :Int {
    case prepaid
    case postpaid
}

struct PackageDataModel {
    let image : String
    let days : String
    let validity:String
    
    
    init(image:String,text:String,validity:String) {
        self.image = image
        self.days = text
        self.validity = validity
    }
}


public class PackViewListCell : UITableViewCell {
    
    public static let reuseIdentifier = "PackViewListCell"
    
    var delegate : PackListsDelegates?
    
     var packList : PartnerPartner?{
        didSet {
            updateBGUI()
        }
    }
    
    var isGiftViewHidden = true
    let UIPadding       = 20
    var packType: SimCategoryType = .postpaid
    
    var stackView       : UIStackView?
    
    let getButton       = ButtonHighlighted()
    let freeGiftButton  = UIButton()
    let offerImage      = UIImageView()
    
    var topPackViews : TopPackView? = nil
    var packDetailView : PackDetailView? = nil
    var freeGiftView : PackFreeGiftView? = nil
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none

    }
    
    
    private func setupStackView() {
        stackView = contentView.VStack(spacing: 14)
        stackView?.fitToSuper(insets: .init(top: 10, left: 16, bottom:0, right: 16))
        stackView?.padding([.bottom], amount: CGFloat(UIPadding))
        stackView?.backgroundColor = .background
        stackView?.cornerRadius = 8
        shadowForViewLight(shadow: stackView!)
    }
    
    func setupUI(){
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
        setupStackView()
        
        //MARK: TOP PACK COLOR VIEW
        topPackViews = TopPackView()
        stackView?.addArrangedSubview((topPackViews?.setupTopPackUI())!)

//        stackView?.addArrangedSubview(topPackViews!)
         //MARK: PACK DETAILS VIEW
        packDetailView = PackDetailView()
        stackView?.addArrangedSubview(packDetailView!)
        
        //MARK: PACK BUTTON VIEW
        addActionButtonView()

        //MARK: PACK FREE GIFT VIEW
        freeGiftView = PackFreeGiftView()
        stackView?.addArrangedSubview((freeGiftView?.addGiftView())!)
//        stackView?.addArrangedSubview(freeGiftView!)
        freeGiftView?.giftView?.isHidden = isGiftViewHidden
        
        contentView.addSubview(offerImage)
        offerImage.position(top: contentView.topAnchor, right: contentView.trailingAnchor, insets: .init(top: 16, left: 0, bottom: 0, right: 8))
        
        updateTextColor()
    }
    
    
    func addActionButtonView() {
        let actionView = UIView()
        freeGiftButton.setImage(UIImage(named: "ic_arrow_down_blue"), for: .normal)
        freeGiftButton.semanticContentAttribute = .forceRightToLeft
        freeGiftButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        freeGiftButton.setTitle("free_gift".localized(), for: .normal)
        freeGiftButton.titleLabel?.font = UIFont.font(ofSize: 14, style: .regular)
        freeGiftButton.setTitleColor(.primaryDark, for: .normal)
        freeGiftButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        freeGiftButton.tag = SimCategoryType.postpaid.rawValue
        actionView.addSubview(freeGiftButton)
        freeGiftButton.position(top: actionView.topAnchor, left: actionView.leadingAnchor,bottom: actionView.bottomAnchor,insets: .init(top: 0, left: 16, bottom: 0, right: 0))
        freeGiftButton.size(height: 40)
        
        
        getButton.setTitle("get".localized(), for: .normal)
        getButton.titleLabel?.font = UIFont.font(ofSize: 14, style: .regular)
        getButton.tag = SimCategoryType.prepaid.rawValue
        getButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        actionView.addSubview(getButton)
        getButton.position(top: actionView.topAnchor, right: actionView.trailingAnchor,insets: .init(top: 0, left: 0, bottom: 0, right: 16))
        getButton.size(width:124,height: 40)
        
        stackView?.addArrangedSubview(actionView)
//        return actionView
    }
    
    
    
    func showAndHideGiftView(){
        freeGiftView?.giftView?.isHidden = !(freeGiftView?.giftView?.isHidden ?? false)
        isGiftViewHidden = freeGiftView?.giftView?.isHidden ?? false
        
        if isGiftViewHidden == false {
            freeGiftButton.setImage(UIImage(named: "ic_arrow_up_blue"), for: .normal)
        } else {
            freeGiftButton.setImage(UIImage(named: "ic_arrow_down_blue"), for: .normal)
        }
    }
    
    
    
    func updateBGUI(){
        
        let rightImage = packList?.type
        if  rightImage == "only_you" {
            offerImage.image = UIImage(named: "ic-onlyforyou")
            topPackViews?.packColorView?.backgroundColor = UIColor.primaryDark
        }else if rightImage == "2x_speed" {
            topPackViews?.packColorView?.backgroundColor = UIColor.red
            offerImage.image = UIImage(named: "ic-speed")
        }else if rightImage == "test" {
            topPackViews?.backgroundColor =  UIColor.white
            
        }else if rightImage == "data" {
            topPackViews?.packColorView?.backgroundColor = UIColor.amethyst
        } else if rightImage == "free_bonus" {
            topPackViews?.packColorView?.backgroundColor = UIColor.yellow
            getButton.setTitle("Refill now", for: .normal)
        }
        
    }
    
    func updateTextColor(){
        guard let colorType = packList?.type else { return  }
 
        topPackViews?.updateTextColor(colorType: colorType)
    }
    
    func configureCell(model:PartnerPartner){
        
    }
    
    
    @objc func tappedButton(_ button: UIButton){
        
        if button.tag == SimCategoryType.postpaid.rawValue {
            print("postpaid")
            showAndHideGiftView()
           
            delegate?.indexItemReload(cell: self, isGiftHidden: isGiftViewHidden)
            print("load...cell...")
        }else if button.tag ==  SimCategoryType.prepaid.rawValue {
            print("prepaid")
            delegate?.getButtonPressed(pack: packList )
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
