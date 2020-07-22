//
//  MenuView.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/21/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class MenuView: UIView, UITableViewDelegate {
    
    let guessInfor: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .lightGray
        
        return view
    } ()
    
    let guessAvt: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.layer.cornerRadius = image.bounds.height / 2
        image.clipsToBounds = true
        
        
        return image
    } ()
    
    let guessName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Guess000000001"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    } ()
    
    let guessID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ID: 2020000001"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    } ()
    
    let cell1: CustomMenuCell = {
        let cell = CustomMenuCell()
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    } ()
    let cell2: CustomMenuCell = {
        let cell = CustomMenuCell()
        cell.translatesAutoresizingMaskIntoConstraints = false
               
        return cell
    } ()
    let cell3: CustomMenuCell = {
        let cell = CustomMenuCell()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.backgroundColor = .darkGray
        return cell
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        
        setupData()
        
        setupMenu()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData() {
        
        cell1.nameFunction.text = "So sánh"
        cell1.icon.image = UIImage(named: "compare_white")
        
        
        cell2.nameFunction.text = "Trợ giúp"
        cell2.icon.image = UIImage(named: "supporter_white")
        
        
        cell3.nameFunction.text = "Thông tin ứng dụng"
        cell3.icon.image = UIImage(named: "infor_white")
    }
    
    func setupMenu() {
        self.addSubview(guessInfor)
        guessInfor.topAnchor.constraint(equalTo: self.topAnchor, constant: 32).isActive = true
        guessInfor.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        guessInfor.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        guessInfor.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        guessInfor.addSubview(guessAvt)
        guessAvt.centerYAnchor.constraint(equalTo: guessInfor.centerYAnchor, constant: 0).isActive = true
        guessAvt.leftAnchor.constraint(equalTo: guessInfor.leftAnchor, constant: 24).isActive = true
        guessAvt.widthAnchor.constraint(equalToConstant: 45).isActive = true
        guessAvt.heightAnchor.constraint(equalToConstant: 45).isActive = true
        guessAvt.layer.cornerRadius = 45 / 2
        
        guessInfor.addSubview(guessName)
        guessName.topAnchor.constraint(equalTo: guessAvt.topAnchor, constant: 0).isActive = true
        guessName.leftAnchor.constraint(equalTo: guessAvt.rightAnchor, constant: 16).isActive = true
        
        guessInfor.addSubview(guessID)
        guessID.bottomAnchor.constraint(equalTo: guessInfor.bottomAnchor, constant: 0).isActive = true
        guessID.leftAnchor.constraint(equalTo: guessName.leftAnchor, constant: 0).isActive = true
        
        setupData()
        
        self.addSubview(cell1)
        cell1.topAnchor.constraint(equalTo: guessInfor.bottomAnchor, constant: 44).isActive = true
        cell1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cell1.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cell1.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.addSubview(cell2)
        cell2.topAnchor.constraint(equalTo: cell1.bottomAnchor, constant: 24).isActive = true
        cell2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cell2.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cell2.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.addSubview(cell3)
        cell3.topAnchor.constraint(equalTo: cell2.bottomAnchor, constant: 24).isActive = true
        cell3.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cell3.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        cell3.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
    
}
