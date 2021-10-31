//
//  RootViewController.swift
//  MemoApp
//
//  Created by 이건준 on 2021/10/29.
//

import UIKit

private let tableCellIdentifier = "cell"
class RootViewController:UITableViewController{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
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
        return appDelegate.data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! TableViewCell
        let memo = appDelegate.data[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.title.text = memo.title
        cell.subTitle.text = memo.description
        cell.dateformat = memo.date
        cell.imageView1.image = memo.image
        return cell
    }
}
