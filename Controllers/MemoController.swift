//
//  MemoController.swift
//  MemoApp
//
//  Created by 이건준 on 2021/10/29.
//

import UIKit

class MemoController:UIViewController{
    lazy var imagePicker:UIImagePickerController={
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.allowsEditing = true
        return picker
    }()
    
    lazy var titleField:UITextField={
        let txt = UITextField()
        txt.widthAnchor.constraint(equalToConstant: view.frame.width-20).isActive = true
        txt.heightAnchor.constraint(equalToConstant: 30).isActive = true
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemRed.cgColor
        txt.placeholder = "  제목"
        return txt
    }()
    
    lazy var descriptionText:UITextView={
       let txt = UITextView()
        txt.widthAnchor.constraint(equalToConstant: view.frame.width-20).isActive = true
        txt.heightAnchor.constraint(equalToConstant: 80).isActive = true
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemRed.cgColor
        txt.textColor = .lightGray
        txt.text = " 내용입력"
        txt.font = UIFont.systemFont(ofSize: 16)
        return txt
    }()
    
    lazy var makeButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("작성", for: UIControl.State.normal)
        btn.widthAnchor.constraint(equalToConstant: (view.frame.width-20)/2-10).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        return btn
    }()
    
    lazy var imageLoadButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("이미지 올리기", for: UIControl.State.normal)
        btn.widthAnchor.constraint(equalToConstant: (view.frame.width-20)/2-10).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(tappedImageLoadBtn), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var imageView:UIImageView={
       let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width-20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.layer.borderColor = UIColor.systemRed.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.descriptionText.delegate = self
        self.imagePicker.delegate = self
    }
    //MARK: -Objc
    @objc func tappedImageLoadBtn(){
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: -Configure
    func configure(){
        self.view.backgroundColor = .systemBackground
    
        view.addSubview(titleField)
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        view.addSubview(descriptionText)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.centerXAnchor.constraint(equalTo: titleField.centerXAnchor).isActive = true
        descriptionText.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: descriptionText.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(makeButton)
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        makeButton.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        makeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(imageLoadButton)
        imageLoadButton.translatesAutoresizingMaskIntoConstraints = false
        imageLoadButton.centerYAnchor.constraint(equalTo: makeButton.centerYAnchor).isActive = true
        imageLoadButton.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
    }
}

extension MemoController:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
              textView.text = nil
              textView.textColor = UIColor.black
            }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
             textView.text = "내용을 입력해주세요."
             textView.textColor = UIColor.lightGray
           }
    }
}
extension MemoController:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true){() in
            let image = info[.editedImage] as! UIImage
            self.imageView.image = image
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true){() in
            let alert = UIAlertController(title: "알림", message: "이미지 미선택", preferredStyle: UIAlertController.Style.alert)
            let positive = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(positive)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
