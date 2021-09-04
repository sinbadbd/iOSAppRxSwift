//
//  PackagesVC.swift
//
//
//  Created by Md. Kamrul Hasan on 12/7/21.
//

import UIKit
import CoreKit
import DataKit
import ViewKit
import RxCocoa
import RxSwift


class PackagesVC: UIViewController {

    var tableView = UITableView()
    let contentSV =  UIStackView()

    var packType : SimCategoryType = .prepaid
    public var viewModel: PackagesVM!
    private var dataList: ListModel?
    private var indexDataArr = [IndexPath]()


    var packDetails : ((PartnerPartner?)-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        Log.info()
        view.backgroundColor = UIColor.init(hex: "#F5F5F5")

        readJson()
    }

    func setupUI(){

        tableView = UITableView(frame: view.frame, style: .grouped)
        view.addSubview(tableView)
        tableView.position(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, insets: .init())
        tableView.tableHeaderView = packHeaderView()
        tableView.layoutTableHeaderView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 50.0
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PackViewListCell.self, forCellReuseIdentifier: PackViewListCell.reuseIdentifier)
        tableView.reloadData()
    }

    func packHeaderView()->UIView{
        let view = UIView()

        //MARK: TOPBAR
        let topBarView = PackTopBar()
        view.addSubview(topBarView)
        topBarView.position(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor)

        //MARK: Balance TOP View
        let balanceView = BalanceView()
        view.addSubview(balanceView)
        balanceView.position(top: topBarView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor,insets: .init(top: 24, left: 0, bottom: 0, right: 0))

        //MARK: Add Card View
        let card = CardView(items: [.reward, .shortcut, .campain])
        contentSV.addArrangedSubview(card)
         view.addSubview(contentSV)
        contentSV.position(top: balanceView.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, insets: .init(top: 24, left: 0, bottom: 10, right: 0))
        return view
    }

    func titleHeaderView(section:Int)->UIView{
        let view = UIView()
        let data = dataList?.data?.attribute?.partners?[section]
        view.backgroundColor = .clear

        let lbl = UILabel()
        lbl.text = "Recommended"
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(lbl)
        lbl.position(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, insets: .init(top: 12, left: 16, bottom: 0, right: 0))

        if section != 0 {
            lbl.setHeight(0)
        }

        let textLbl = UILabel()
        view.addSubview(textLbl)
        textLbl.position(top: lbl.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, insets: .init(top: 5, left: 16, bottom: 4, right: 16))
        textLbl.text =  data?.catName
        textLbl.font = UIFont.systemFont(ofSize: 16)
        return view

    }
    func readJson(){
        if let path = Bundle.main.path(forResource: "list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                do {
                    // get the data from JSON file with help of struct and Codable
                    let model = try decoder.decode(ListModel.self, from: data)
                    // from here you can populate data in tableview
                    print(model)
                    self.dataList = model
                    DispatchQueue.main.async { [self] in
                        setupUI()
                    }

                }catch{
                    print(error) // shows error
                    print("Decoding failed")// local message
                }

            } catch {
                print(error) // shows error
                print("Unable to read file")// local message
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Log.info()
    }

    deinit { Log.info() }

}

extension PackagesVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList?.data?.attribute?.partners?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList?.data?.attribute?.partners?[section].partner?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PackViewListCell.reuseIdentifier, for: indexPath) as! PackViewListCell
        cell.delegate = self
        let indexSection = dataList?.data?.attribute?.partners?[indexPath.section]
        let indexData = indexSection?.partner?[indexPath.row]
        cell.packList = indexData
        cell.isGiftViewHidden = !indexDataArr.contains(indexPath)
        cell.setupUI()
        cell.updateBGUI()
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return titleHeaderView(section: section)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 70
        }else {
            return 40
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension PackagesVC: PackListsDelegates {



    func getButtonPressed(pack: PartnerPartner?) {
        packDetails?(pack)
    }


    func indexItemReload(cell: PackViewListCell, isGiftHidden: Bool) {

        guard let indexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            self.tableView.performBatchUpdates(nil)
        }
        if isGiftHidden == false {
            indexDataArr.append(indexPath)
        }else{
             indexDataArr.remove(element: indexPath)
         }
        print(indexDataArr)
    }
}
