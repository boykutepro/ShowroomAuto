//
//  HomeMercedesViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/24/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class HomeMercedesViewController: UIViewController {
    let containerView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    } ()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mercedes Benz"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 35)
        return label
    } ()
    
    let iconBack: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "back2_white")
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        return image
    } ()
    
    let nameListSegmentControl: UISegmentedControl = {
        let sm = UISegmentedControl(items: ["Thông dụng", "Chở người", "Chở hàng", "Đầu kéo"])
        sm.translatesAutoresizingMaskIntoConstraints = false
        //  sm.selectedSegmentIndex = 0
        sm.addTarget(self, action: #selector(handleSegmentChoose), for: .valueChanged)
        sm.backgroundColor = .lightGray
        sm.isSelected = true
        sm.tintColor = .black
        sm.selectedSegmentTintColor = .black
        //sm.selectedSegmentIndex = 0
        return sm
    } ()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.bounces = false
        return view
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(back))
        iconBack.addGestureRecognizer(tapGesture)
        
        let chooseGesture = UITapGestureRecognizer(target: self, action: #selector(goTo))
        scrollView.addGestureRecognizer(chooseGesture)
        
    }
    
    @objc func goTo() {
        let nextVC = DetailViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(iconBack)
        iconBack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconBack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        iconBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconBack.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(welcomeLabel)
        welcomeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        welcomeLabel.leftAnchor.constraint(equalTo: iconBack.rightAnchor, constant: 6).isActive = true
        
        containerView.addSubview(nameListSegmentControl)
        nameListSegmentControl.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 32).isActive = true
        nameListSegmentControl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        nameListSegmentControl.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12).isActive = true
        
        containerView.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: nameListSegmentControl.bottomAnchor, constant: 24).isActive = true
        scrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
    
    }
    
    @objc func handleSegmentChoose() {
        switch nameListSegmentControl.selectedSegmentIndex {
        case 0:
           
            scrollView.reloadInputViews()
            print("Choose Passenger Car")
            let image1 = UIImageView()
            image1.image = UIImage(named: "Pass1")
            image1.contentMode = .scaleAspectFit
            scrollView.addSubview(image1)
            image1.frame = CGRect(x: 0, y: 0, width: 414, height: 625)
            
            let image2 = UIImageView()
            image2.image = UIImage(named: "Pass2")
            image2.contentMode = .scaleAspectFit
            scrollView.addSubview(image2)
            image2.frame = CGRect(x: 0, y: 620, width: 414, height: 627)
            
            let image3 = UIImageView()
            image3.image = UIImage(named: "Pass3")
            image3.contentMode = .scaleAspectFit
            scrollView.addSubview(image3)
            image3.frame = CGRect(x: 0, y: 1240, width: 414, height: 625)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1880)
            
        case 1:
            print("Choose Vans")
            let image1 = UIImageView()
            image1.image = UIImage(named: "Vans")
            image1.contentMode = .scaleAspectFit
            scrollView.addSubview(image1)
            image1.frame = CGRect(x: 0, y: 0, width: 414, height: 625)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 625)
            
        case 2:
            print("Choose Truck")
            let image1 = UIImageView()
            image1.image = UIImage(named: "Truck")
            image1.contentMode = .scaleAspectFit
            scrollView.addSubview(image1)
            image1.frame = CGRect(x: 0, y: 0, width: 414, height: 625)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 625)
        default:
            
            print("Choose Unimog")
            let image1 = UIImageView()
            image1.image = UIImage(named: "Unimog")
            image1.contentMode = .scaleAspectFit
            scrollView.addSubview(image1)
            image1.frame = CGRect(x: 0, y: 0, width: 414, height: 625)
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 630)
        }
    }
}
