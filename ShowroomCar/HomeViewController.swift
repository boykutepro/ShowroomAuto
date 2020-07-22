//
//  HomeViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/20/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let buttonMenu: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    } ()
    
    let buttonSearch: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    let iconMenu: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "menu3")
        image.contentMode = .scaleToFill
        
        return image
    } ()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 40)
        return label
    } ()
    
    let searchIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "search")
        image.contentMode = .scaleToFill
        
        return image
    } ()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    } ()
    
    let chooseView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "HomeVC")
        
        return view
    } ()
    
    let menuView: MenuView = {
        let view = MenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    } ()
    var isOpen: Bool = false
    
    let chooseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    let compareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    } ()
    
    let supportButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // contentView
        containerView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // In ContentView
        contentView.addSubview(iconMenu)
        iconMenu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        iconMenu.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        iconMenu.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconMenu.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(buttonMenu)
        buttonMenu.topAnchor.constraint(equalTo: iconMenu.topAnchor, constant: 0).isActive = true
        buttonMenu.leftAnchor.constraint(equalTo: iconMenu.leftAnchor, constant: 0).isActive = true
        buttonMenu.rightAnchor.constraint(equalTo: iconMenu.rightAnchor, constant: 0).isActive = true
        buttonMenu.bottomAnchor.constraint(equalTo: iconMenu.bottomAnchor, constant: 0).isActive = true
        buttonMenu.addTarget(self, action: #selector(menuOut), for: .touchUpInside)
        
        
        // Label
        contentView.addSubview(welcomeLabel)
        welcomeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        welcomeLabel.leftAnchor.constraint(equalTo: iconMenu.rightAnchor, constant: 6).isActive = true
        // Search Icon
        contentView.addSubview(searchIcon)
        searchIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        searchIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        searchIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.addSubview(buttonSearch)
        buttonSearch.topAnchor.constraint(equalTo: searchIcon.topAnchor, constant: 0).isActive = true
        buttonSearch.leftAnchor.constraint(equalTo: searchIcon.leftAnchor, constant: 0).isActive = true
        buttonSearch.rightAnchor.constraint(equalTo: searchIcon.rightAnchor, constant: 0).isActive = true
        buttonSearch.bottomAnchor.constraint(equalTo: searchIcon.bottomAnchor, constant: 0).isActive = true
        buttonSearch.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        // Image
        containerView.addSubview(chooseView)
        chooseView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        chooseView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        chooseView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        chooseView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        //menu
        view.addSubview(menuView)
        menuView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        menuView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        menuView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        menuView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        //
        view.addSubview(chooseButton)
        chooseButton.topAnchor.constraint(equalTo: chooseView.topAnchor, constant: 120).isActive = true
        chooseButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        chooseButton.rightAnchor.constraint(equalTo: chooseView.rightAnchor, constant: -14).isActive = true
        chooseButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        chooseButton.addTarget(self, action: #selector(nextToMerHome), for: .touchUpInside)
        
        view.addSubview(compareButton)
        compareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 210).isActive = true
        compareButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        compareButton.rightAnchor.constraint(equalTo: menuView.rightAnchor, constant: 0).isActive = true
        compareButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        compareButton.addTarget(self, action: #selector(compareVC), for: .touchUpInside)
        
        view.addSubview(supportButton)
        supportButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 285).isActive = true
        supportButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        supportButton.rightAnchor.constraint(equalTo: menuView.rightAnchor, constant: 0).isActive = true
        supportButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        supportButton.addTarget(self, action: #selector(supportVC), for: .touchUpInside)
        
    }
    
    @objc func compareVC() {
        let compVC = storyboard?.instantiateViewController(withIdentifier: "compVC")
        compVC!.modalPresentationStyle = .fullScreen
        
        present(compVC!, animated: true, completion: nil)
    }
    
    @objc func supportVC(){
        let supVC = SupportViewController()
        supVC.modalPresentationStyle = .fullScreen
        
        present(supVC, animated: true, completion: nil)
    }
    @objc func nextToMerHome() {
        print("go go Mer Home")
        let merHome = HomeMercedesViewController()
        merHome.modalPresentationStyle = .fullScreen
        present(merHome, animated: true, completion: nil)
    }
    
    @objc func menuOut() {
        print("menu")
        if isOpen == false {
            UIView.animate(withDuration: 0.3) {
                self.iconMenu.transform = CGAffineTransform(rotationAngle: .pi/2)
                self.menuView.alpha = 1
            }
            self.menuView.isHidden = false
            isOpen = !isOpen
            chooseButton.isHidden = true
            compareButton.isHidden = false
            supportButton.isHidden = false
            
        } else {
            //            UIView.animate(withDuration: 0.3) {
            //                self.iconMenu.transform = CGAffineTransform(rotationAngle: 0)
            //                self.menuView.alpha = 0
            //            }
            UIView.animate(withDuration: 0.3, animations: {
                self.iconMenu.transform = CGAffineTransform(rotationAngle: 0)
                self.menuView.alpha = 0
            }) { (true) in
                self.menuView.isHidden = true
            }
            isOpen = !isOpen
            chooseButton.isHidden = false
            compareButton.isHidden = true
            supportButton.isHidden = true
        }
    }
    
    @objc func search() {
        
        print("search")
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .fullScreen
        present(searchVC, animated: true, completion: nil)
        
    }
    
    
}
