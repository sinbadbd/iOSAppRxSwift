//
//  ViewController.swift
//  iOSAppRxSwift
//
//  Created by Imran on 15/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    var arr = [2]
    
    var indexArray = [1,2,3,4,5,6]
    var currentIndex = 0
    
    var setTitle : UILabel  = {
        let title = UILabel()
        title.text = "0"
        return title
    }()
    
    let tapButton  : UIButton = {
        let button = UIButton()
        button.setTitle("Tap Button", for: .normal)
        button.addTarget(self, action: #selector(handleTapButton), for: .touchUpInside)
        button.backgroundColor = .red
        button.layer.cornerRadius = 4
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tapButton)
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        tapButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        tapButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tapButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tapButton.tag = currentIndex
        
        
        view.addSubview(setTitle)
        setTitle.translatesAutoresizingMaskIntoConstraints = false
        setTitle.topAnchor.constraint(equalTo: tapButton.bottomAnchor, constant: 20).isActive = true
        setTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        setTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        setTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleTapButton(_ sender: UIButton){
        
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .transitionCurlUp) {
            sender.alpha = 0.5
        } completion: { [self] (_) in
            sender.alpha = 1
            if indexArray.count > 0 {
                if currentIndex != indexArray.count {
                    currentIndex+=1
                    setTitle.text = "Score: \(currentIndex)"
                }
            }else{
                print("over load")
            }
        }
        
    }
    
    func arry (){
        
        for item in arr {
            print(item)
            arr = [3,7,78,]
            print(arr)
        }
    }
    
}

