//
//  PictureListVC.swift
//  iOSAppRxSwift
//
//  Created by Imran Mia on 3/9/21.
//

import UIKit
import RxSwift
import RxCocoa

struct Picture {
    let image: String
    let title: String
    
    init(image:String,title:String) {
        self.image = image
        self.title = title
    }
}

class PictureListVC: UIViewController {
    
    var dispose = DisposeBag()
    let listData = BehaviorRelay.init(value: [
        Picture.init(image: "image0", title: "hisf one 131331"),
        Picture.init(image: "image1", title: "werewr 123123123123"),
        Picture.init(image: "image2", title: "114 fsfsfsfsfsfsf"),
        Picture.init(image: "image3", title: "5 71231313"),
        Picture.init(image: "image4", title: "f bbebebebe"),
        Picture.init(image: "image5", title: "x msdf enenenene"),
        Picture.init(image: "image6", title: "hah  2432424242"),
        Picture.init(image: "image7", title: "overlfo gaggagagagg"),
        Picture.init(image: "image8", title: "java 097070790"),
        Picture.init(image: "image9", title: "gam game mklmlml"),
        Picture.init(image: "image10", title: "a z")
    ])
    
    var filteredTableData:[String] = []
    
    
    //    private var dataList: ListModel?
    let tableView = UITableView()
    lazy var searchBar:UISearchBar = UISearchBar()
    var isSearch = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Your Title"
        
        //        tableView.separatorStyle = .none
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.position(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, insets: .init())
        tableView.register(PictureCell.self, forCellReuseIdentifier: PictureCell.reuseIdentifier)
        tableView.delegate = self
        //        tableView.dataSource = self
        
        
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        //          searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        
        setUI()
    }
    
    func setUI(){
        
        
        let picQuery = searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map({ query in
                self.listData.value.filter { pic in
                    query.isEmpty || pic.title.lowercased().contains(query
                                                                        .lowercased())
                }
            })
            .bind(to: tableView
                    .rx
                    .items(
                        cellIdentifier: PictureCell.reuseIdentifier,
                        cellType: PictureCell.self)) {
                (_, listData, cell) in
                
                
                cell.picImage.image = UIImage(named: listData.image)
                cell.lblText.text = listData.title
                
            }.disposed(by: dispose)
        
        
        tableView
            .rx
            .modelSelected(Picture.self)
            .subscribe(onNext: { picList in
                let vc = PictureDeatilsVC()
                //                vc.piclist = pic
                vc.imangeName.accept(picList)
                self.navigationController?.pushViewController(vc, animated: true)
                
            }).disposed(by: dispose)
        
        
        
        //        tableView.rx.itemSelected
        //          .subscribe(onNext: { [weak self] indexPath in
        //            _ = self?.tableView.cellForRow(at: indexPath) as? PictureCell
        //            print(indexPath.row)
        //
        //            let vc = PictureDeatilsVC()
        //            vc.piclist = indexPath.item
        //            self?.navigationController?.pushViewController(vc, animated: true)
        //
        //          }).disposed(by: dispose)
        
    }
    
    
}
extension PictureListVC:UITableViewDelegate {
    
}
//
//extension PictureListVC: UISearchBarDelegate{
//    //MARK: UISearchbar delegate
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//           isSearch = true
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//           searchBar.resignFirstResponder()
//           isSearch = false
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//           searchBar.resignFirstResponder()
//           isSearch = false
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//           searchBar.resignFirstResponder()
//           isSearch = false
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        print(searchText)
//        if searchText.count == 0 {
//            isSearch = false
//            self.tableView.reloadData()
//        } else {
////            filteredTableData = listData.filter({ (text) -> Bool in
////                let tmp: NSString = text as NSString
////                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
////                return range.location != NSNotFound
////            })
//            if(filteredTableData.count == 0){
//                isSearch = false
//            } else {
//                isSearch = true
//            }
//            self.tableView.reloadData()
//        }
//    }
//
//}
//
