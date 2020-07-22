//
//  SearchViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/22/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bmwOrange")
        image.contentMode = .scaleAspectFill
        return image
    } ()
    
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    let modelTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Hãng xe"
        tf.textAlignment = .left
        tf.textColor = .orange
        tf.backgroundColor = .darkGray
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(string: "Hãng xe", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 1, green: 0.7023781759, blue: 0.290687305, alpha: 1).withAlphaComponent(1), range:NSRange(location: 0, length: 7))
        tf.attributedPlaceholder = placeHolder
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1
        
        return tf
    } ()
    
    let colorTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Màu sắc"
        tf.textAlignment = .left
        tf.textColor = .orange
        tf.backgroundColor = .darkGray
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(string: "Màu sắc", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 1, green: 0.7023781759, blue: 0.290687305, alpha: 1).withAlphaComponent(1), range:NSRange(location: 0, length: 7))
        tf.attributedPlaceholder = placeHolder
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1
        return tf
    } ()
    
    let minPriceTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Giá thấp nhất"
        tf.textAlignment = .left
        tf.textColor = .orange
        tf.backgroundColor = .darkGray
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(string: "Giá thấp nhất", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 1, green: 0.7023781759, blue: 0.290687305, alpha: 1).withAlphaComponent(1), range:NSRange(location: 0, length: 13))
        tf.attributedPlaceholder = placeHolder
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1
        return tf
    } ()
    
    let maxPriceTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Giá cao nhất"
        tf.textAlignment = .left
        tf.textColor = .orange
        tf.backgroundColor = .darkGray
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(string: "Giá cao nhất", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!])
        placeHolder.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 1, green: 0.7023781759, blue: 0.290687305, alpha: 1).withAlphaComponent(1), range:NSRange(location: 0, length: 12))
        tf.attributedPlaceholder = placeHolder
        tf.layer.borderColor = UIColor.white.cgColor
        tf.layer.borderWidth = 1
        return tf
    } ()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back2_white"), for: .normal)
        return button
    } ()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SEARCH", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1
        button.clipsToBounds = true
        button.backgroundColor = #colorLiteral(red: 1, green: 0.7023781759, blue: 0.290687305, alpha: 1)
        return button
    } ()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nhập thông tin vào ô dưới để tìm kiếm"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 24)
        label.numberOfLines = 0
        return label
    } ()
    
    let paddingView1: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 12, height: 45)
        return view
    } ()
        
    let paddingView2: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 12, height: 45)
        return view
    } ()
    
    let paddingView3: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 12, height: 45)
        return view
    } ()
    
    let paddingView4: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 12, height: 45)
        return view
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        setupLayout()
        setupToolBar()
    }
    
    func setupToolBar() {
        let toolBar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.size.width, height: 30)))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
        
        toolBar.setItems([doneButton], animated: true)
        toolBar.sizeToFit()
        
        modelTF.inputAccessoryView = toolBar
        colorTF.inputAccessoryView = toolBar
        minPriceTF.inputAccessoryView = toolBar
        maxPriceTF.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    func setupLayout () {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.25).isActive = true
        
        containerView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 52).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        contentView.addSubview(modelTF)
        modelTF.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 166).isActive = true
        modelTF.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        modelTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        modelTF.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45).isActive = true
        modelTF.leftView = paddingView1
        modelTF.leftViewMode = UITextField.ViewMode.always
        
        contentView.addSubview(colorTF)
        colorTF.topAnchor.constraint(equalTo: modelTF.topAnchor, constant: 0).isActive = true
        colorTF.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12).isActive = true
        colorTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        colorTF.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45).isActive = true
        colorTF.leftView = paddingView2
        colorTF.leftViewMode = UITextField.ViewMode.always
        
        contentView.addSubview(minPriceTF)
        minPriceTF.topAnchor.constraint(equalTo: modelTF.bottomAnchor, constant: 64).isActive = true
        minPriceTF.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        minPriceTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        minPriceTF.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45).isActive = true
        minPriceTF.leftView = paddingView3
        minPriceTF.leftViewMode = UITextField.ViewMode.always
       
        contentView.addSubview(maxPriceTF)
        maxPriceTF.topAnchor.constraint(equalTo: minPriceTF.topAnchor, constant: 0).isActive = true
        maxPriceTF.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12).isActive = true
        maxPriceTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        maxPriceTF.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45).isActive = true
        maxPriceTF.leftView = paddingView4
        maxPriceTF.leftViewMode = UITextField.ViewMode.always
        
        containerView.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        view.addSubview(searchButton)
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        
        
    }
    
    @objc func search() {
        print("Tạm thời tính năng này chưa hoạt động")
        let alert = UIAlertController(title: "Rất tiếc", message: "Tính năng hiện đang được bảo trì", preferredStyle: .alert)
        let done = UIAlertAction(title: "Đã hiểu", style: .cancel, handler: nil)
        alert.addAction(done)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}
