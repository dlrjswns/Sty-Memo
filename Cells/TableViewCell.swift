//
//  TableViewCell.swift
//  MemoApp
//
//  Created by 이건준 on 2021/10/29.
//

import UIKit

class TableViewCell:UITableViewCell{
    var dateformat:Date?{
        didSet{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "HH:mm:ss"
            let dte = dateformatter.string(from: dateformat!)
            date.text = dte
        }
    }
    
    lazy var title:UILabel={
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var subTitle:UILabel={
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    lazy var imageView1:UIImageView={
       let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var date:UILabel={
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
    func configure(){
        self.addSubview(imageView1)
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        imageView1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        title.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: 5).isActive = true
        
        self.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        subTitle.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: 5).isActive = true
        
        
        self.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        date.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
