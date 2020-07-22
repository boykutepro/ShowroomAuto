//
//  DetailViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/29/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    } ()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    } ()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        return view
    } ()
    
    let buttonBack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back2_white"), for: .normal)
        return button
    } ()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mercedes E-Series"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        label.font = UIFont(name: "Hiragino Mincho ProN W6", size: 32)
        return label
    } ()
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mercedes")
        image.contentMode = .scaleAspectFill
        return image
    } ()
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logomer")
        image.contentMode = .scaleAspectFit
        return image
    } ()

    var images: [String] = []
    
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupData()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        buttonBack.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundColor = .white
        
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        contentView.addSubview(imageBackground)
        imageBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageBackground.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageBackground.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(buttonBack)
        buttonBack.topAnchor.constraint(equalTo: imageBackground.topAnchor, constant: 12).isActive = true
        buttonBack.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 12).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
//        contentView.addSubview(logo)
//        logo.bottomAnchor.constraint(equalTo: imageBackground.bottomAnchor, constant: 38).isActive = true
//        logo.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: -22).isActive = true
//        logo.centerYAnchor.constraint(equalTo: buttonBack.centerYAnchor, constant: 10).isActive = true
//        logo.leftAnchor.constraint(equalTo: buttonBack.rightAnchor, constant: -20).isActive = true
//        logo.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        logo.widthAnchor.constraint(equalToConstant: 150).isActive = true
//
        contentView.addSubview(contentLabel)
        contentLabel.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor, constant: 0).isActive = true
        contentLabel.topAnchor.constraint(equalTo: imageBackground.topAnchor, constant: 14).isActive = true
       
        
        containerView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupData() {
        images = ["mecE200", "mecE250", "mecE300", "mecE300AMG", "mecE350"]
        names = ["E-200", "E-250", "E-300", "E-300 AMG", "E-350"]
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        cell.imageCar.image = UIImage(named: images[indexPath.row])
        cell.nameCarLabel.text = names[indexPath.row]
        cell.nameCarLabel.textColor = .black
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
//        return UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let nextVC = ProfileViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
}
