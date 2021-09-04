//
//  PictureDeatilsVC.swift
//  iOSAppRxSwift
//
//  Created by Imran Mia on 3/9/21.
//

import UIKit
import RxSwift
import RxCocoa

class PictureDeatilsVC: UIViewController {

    var piclist: Picture?
    
    var imageV : UIImageView? = nil
    var titleText : UILabel? = nil
    
    let imangeName : BehaviorRelay = BehaviorRelay<Picture>(value: .init(image: "", title: ""))
    let disposeBag2 = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageV = UIImageView()
        imageV?.image = UIImage(named: piclist?.image ?? "")
        view.addSubview(imageV!)
        imageV?.contentMode = .scaleToFill
        imageV?.position(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, insets: .init(top: 60, left: 0, bottom: 0, right: 0))
        imageV?.size(height:150)
        
        
        titleText = UILabel()
        view.addSubview(titleText!)
        titleText?.position(top: imageV?.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, insets: .init(top: 10, left: 20, bottom: 20, right: 20))
        titleText?.text = "sdf"
        updateUI()
    }
  
    
    func updateUI(){
        imangeName
            .map( { [self] item in
                UIImage(named: item.image)
                 
            })
            .bind(to:
                    ((imageV?
                        .rx
                        .image)!))
            .disposed(by: disposeBag2)
    }

}
