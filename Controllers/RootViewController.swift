//
//  RootViewController.swift
//  MemoApp
//
//  Created by 이건준 on 2021/10/29.
//

import UIKit

private let tableCellIdentifier = "cell"
class RootViewController:UITableViewController{
    var data = [Memo]()
    
    lazy var nvItem:UIBarButtonItem={
        let nv = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(rightButtonTapped))
        return nv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationItem.title = "목록"
        navigationItem.rightBarButtonItem = nvItem
    }
    //MARK: -Objc
    @objc func rightButtonTapped(){
        navigationController?.pushViewController(MemoController(), animated: true)
    }
    
    //MARK: -Configure
    func configure(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
    }
}
extension RootViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! TableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.title.text = "글의 제목"
        cell.subTitle.text = "글의 내용"
        cell.dateformat = Date()
        return cell
    }
}
