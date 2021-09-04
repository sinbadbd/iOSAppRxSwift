//
//  BalanceView.swift
//  BalanceView
//
//  Created by Imran on 24/8/21.
//

import UIKit
import CoreKit

public class BalanceView: UIView {
    
    public let balanceLbl = UILabel()
    
    lazy var  VStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fill // .fillEqually .fillProportionally .equalSpacing .equalCenterin
        stackView.spacing = 10
        return stackView
    }()
    let numberLbl = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(VStackView)
        //        backgroundColor = .blue
        VStackView.position(
            top: topAnchor,
            left: leadingAnchor,
            bottom: bottomAnchor,
            right: trailingAnchor,
            insets: .init(
                top: 10,
                left: 16,
                bottom: 0,
                right: 16)
        )
        
       
        
        let attrStrBalance = getAttributedText(string: "Balance:", font: UIFont.systemFont(ofSize: 16), color: .text, lineSpace: 0, alignment: .left)
       
        let attrStrBalance2 = getUnderlinedAttributedText(string: " 850.00", font: UIFont.boldSystemFont(ofSize: 16), color: .primaryDark, lineSpace: 0, alignment: .left)
        
        attrStrBalance.append(attrStrBalance2)
        self.balanceLbl.attributedText = attrStrBalance
        self.balanceLbl.numberOfLines = 0
        balanceLbl.textAlignment = .right
        
        numberLbl.text = "080-568-6912"
        numberLbl.font = UIFont.systemFont(ofSize: 16)
        
        
        VStackView.addArrangedSubview(numberLbl)
        VStackView.addArrangedSubview(balanceLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
