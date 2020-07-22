//
//  SelectLanguage.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/13/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class SelectLanguage: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    let topImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "6")
        
        return image
    } ()
    
    let contentView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BlackGradient")
        
        return image
    } ()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Chọn ngôn ngữ của bạn"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        
        return label
    } ()
    
    let midLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Tất cả nội dung sẽ được hiển thị theo ngôn ngữ bạn chọn trong mục bên dưới"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        
        return label
    } ()
    
    let groupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    } ()
    
    let languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tiếng Việt"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Time New Roman", size: 24)
        
        return label
    } ()
    
    let dropDownButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "icon_dropdown"), for: .normal)
        button.backgroundColor = .white
        
        return button
    } ()
    
    let goButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.backgroundColor = .black
        button.setTitle("GO", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 32)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 0.4
        
        return button
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        goButton.addTarget(self, action: #selector(nextToHomeVC), for: .touchUpInside)
    }
    
    
    func setupLayout() {
        //containerView
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        //ImageTop
        containerView.addSubview(topImage)
        topImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        topImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        topImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //ContentView
        containerView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        //Top Label
        contentView.addSubview(topLabel)
        topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48).isActive = true
        topLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        //Mid label
        contentView.addSubview(midLabel)
        midLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 4).isActive = true
        midLabel.leftAnchor.constraint(equalTo: topLabel.leftAnchor, constant: 0).isActive = true
        midLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        // GroupView
        contentView.addSubview(groupView)
        groupView.topAnchor.constraint(equalTo: midLabel.bottomAnchor, constant: 98).isActive = true
        groupView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        groupView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        groupView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        // Label
        groupView.addSubview(languageLabel)
        languageLabel.centerXAnchor.constraint(equalTo: groupView.centerXAnchor, constant: -30).isActive = true
        languageLabel.centerYAnchor.constraint(equalTo: groupView.centerYAnchor, constant: 0).isActive = true
        
        // Button
        groupView.addSubview(dropDownButton)
        dropDownButton.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor, constant: 0).isActive = true
        dropDownButton.leftAnchor.constraint(equalTo: languageLabel.rightAnchor, constant: 40).isActive = true
        dropDownButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        dropDownButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // Next
        view.addSubview(goButton)
        goButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        goButton.topAnchor.constraint(equalTo: groupView.bottomAnchor, constant: 82).isActive = true
        goButton.widthAnchor.constraint(equalToConstant: 320).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    @objc func nextToHomeVC() {
        
//        print("abc")
//        let homeVC = HomeViewController()
//        homeVC.modalPresentationStyle = .fullScreen
//        present(homeVC, animated: true, completion: nil)
        
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "homeVC")
        homeVC!.modalPresentationStyle = .fullScreen
        
        present(homeVC!, animated: true, completion: nil)
        
    }


}
