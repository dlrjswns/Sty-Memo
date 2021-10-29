//
//  MemoController.swift
//  MemoApp
//
//  Created by 이건준 on 2021/10/29.
//

import UIKit

class MemoController:UIViewController{
    lazy var titleField:UITextField={
        let txt = UITextField()
        txt.widthAnchor.constraint(equalToConstant: view.frame.width-20).isActive = true
        txt.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemRed.cgColor
        txt.placeholder = "제목"
        return txt
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        self.view.backgroundColor = .systemBackground
    
        view.addSubview(titleField)
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        
    }
}
