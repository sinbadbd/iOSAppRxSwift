//
//  PaackTopBar.swift
//  DTAC
//
//  Created by Imran Mia on 31/8/21.
//

import UIKit

protocol PackTopBarButtonProtocol {
    func giftButtonPressed(send:UIButton)
    func notiButtonPressed(send:UIButton)
}

class PackTopBar: UIView {

    lazy var  VStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fill // .fillEqually .fillProportionally .equalSpacing .equalCenterin
        stackView.spacing = 10
        return stackView
    }()
    
    let packTitle = UILabel()
    
    var delegate: PackTopBarButtonProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(VStackView)
        VStackView.fitToSuper(insets: .init(top: 10, left: 16, bottom: 0, right: 16))
        
        VStackView.addArrangedSubview(packTitle)
        packTitle.text = "Packages"
        packTitle.textColor = .text
        packTitle.font = UIFont.systemFont(ofSize: 20)
        
        let iconView = UIView()
        VStackView.addArrangedSubview(iconView)

        //MARK: GIFT ICON
        let giftIconBtn = UIButton()
        giftIconBtn.size(width:24,height: 24)
        let ic_offer = UIImage(named: "ic_offer")
        giftIconBtn.setImage(ic_offer?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        giftIconBtn.tintColor = .primaryDark
        giftIconBtn.addTarget(self, action: #selector(handleGiftButtonPressed), for: .touchUpInside)
        giftIconBtn.tag = 1
        
        //MARK: NOTI ICON
        let notifiIconBtn = UIButton()
        notifiIconBtn.size(width:24,height: 24)
        let ic_notification_image = UIImage(named: "ic_notification")
        notifiIconBtn.setImage(ic_notification_image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        notifiIconBtn.tintColor = .primaryDark
        notifiIconBtn.addTarget(self, action: #selector(handleGiftButtonPressed), for: .touchUpInside)
        notifiIconBtn.tag = 2
        
        VStackView.addArrangedSubview(giftIconBtn)
        VStackView.addArrangedSubview(notifiIconBtn)
    }
    
    @objc func handleGiftButtonPressed(_ button: UIButton){
        UIView.animate(withDuration: 0.5) {
            button.alpha = 0.5
        } completion: { [self] _ in
            button.alpha = 1
            
            if button.tag == 1 {
                print("gift btn")
                if delegate != nil {
                    delegate?.giftButtonPressed(send: button)
                }
                
            }else if button.tag == 2 {
                print("noti icon")
                if delegate != nil {
                    delegate?.notiButtonPressed(send: button)
                }
            }
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
