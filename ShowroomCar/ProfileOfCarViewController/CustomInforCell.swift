//
//  CustomInforCell.swift
//  ShowroomCar
//
//  Created by Thien Tung on 3/2/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class CustomInforCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    let name: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Times New Roman", size: 16)
        label.numberOfLines = 0
        return label
    } ()
    
    let number: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.textColor = .black
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    } ()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setupCell()
    }
    
    func setupCell() {
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(name)
        name.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        name.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 6).isActive = true
        name.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/3).isActive = true
        name.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.9).isActive = true
        name.text = "Name"
        
        containerView.addSubview(number)
        number.centerYAnchor.constraint(equalTo: name.centerYAnchor, constant: 0).isActive = true
        number.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -6).isActive = true
        number.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/3).isActive = true
        number.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.9).isActive = true
        number.text = "Number"
    }
    

}
