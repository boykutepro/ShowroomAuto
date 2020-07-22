//
//  CustomMenuCell.swift
//  ShowroomCar
//
//  Created by Thien Tung on 2/21/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class CustomMenuCell: UIView {

    let icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.layer.cornerRadius = icon.bounds.height / 2
        icon.clipsToBounds = true
        return icon
    } ()
    
    let nameFunction: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.isUserInteractionEnabled = true
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        icon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 1).isActive = true
        
        self.addSubview(nameFunction)
        nameFunction.centerYAnchor.constraint(equalTo: icon.centerYAnchor, constant: 0).isActive = true
        nameFunction.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 16).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
