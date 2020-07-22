//
//  ProfileViewController.swift
//  ShowroomCar
//
//  Created by Thien Tung on 3/2/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIScrollViewDelegate {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back2_white"), for: .normal)
        return button
    } ()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mercedes E-350"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.black
        label.font = UIFont(name: "Hiragino Mincho ProN W6", size: 32)
        return label
    } ()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
       // view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        return view
    } ()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    } ()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.pageIndicatorTintColor = .white
        control.currentPageIndicatorTintColor = .lightGray
        control.numberOfPages = 7
        control.currentPage = 0
        
        return control
    } ()
    
    var images:[String] = ["dauxe", "hongxe", "mamxe", "dongho", "noithat", "tiennghi", "ghesau"]
    
    var datas: [infor] = []
    
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        scrollView.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupView()
        setupScrollView()
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        tableView.register(CustomInforCell.self, forCellReuseIdentifier: "inforCell")
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: .none), forCellReuseIdentifier: "cell1")
        
        timer = Timer.scheduledTimer(timeInterval: 2.4, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    var xOffset: CGFloat = 0
    
    @objc func timerAction() {
        
        if xOffset > (scrollView.contentSize.width - 2*414) {
            xOffset = 0
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.scrollView.contentOffset.x = self.xOffset
                }
            }
            
        }else{
            xOffset += 414
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.7) {
                    self.scrollView.contentOffset.x = self.xOffset
                }
            }
        }
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupData() {
        datas = [ infor(name: "Tên", number: "Mercedes E350 AMG"),
                  infor(name: "Giá bán", number: "2890000000"),
                  infor(name: "Số chỗ ngồi", number: "5 chỗ"),
                  infor(name: "Kích thước (mm)", number: "4925x1852 x1470"),
                  infor(name: "Tải trọng (kg)", number: "2939"),
                  infor(name: "Mâm xe", number: "Đúc, 19inch"),
                  infor(name: "Động cơ", number: "Xăng, Turbo EQ Boost"),
                  infor(name: "Số xylanh", number: "4"),
                  infor(name: "Dung tích động cơ", number: "1991cc"),
                  infor(name: "Công suất", number: "299Hp/5800rpm"),
                  infor(name: "Momen xoắn", number: "400Nm/3000rpm"),
                  infor(name: "Hộp số", number: "AT 9G Tronic"),
                  infor(name: "Tăng tốc", number: "5,9s (0-100km/h)"),
                  infor(name: "Maxspeed", number: "299km/h"),
                  infor(name: "Mức tiêu hao NL", number: "9L/100km"),
                  infor(name: "Dẫn động", number: "4matic"),
                  infor(name: "Bình NL", number: "60 lít"),
                  infor(name: "Trợ lực", number: "Điện"),
                  infor(name: "Màu sơn", number: "Trắng/Đen"),
                  infor(name: "Đèn", number: "Multi-Beam"),
                  infor(name: "Cửa sổ trời", number: "Có"),
                  infor(name: "Loa", number: "Burmester 13 loa"),
                  infor(name: "Ghế chỉnh điện", number: "Có"),
                  infor(name: "Sưởi ghế", number: "Có"),
                  infor(name: "ABS", number: "Có")
        ]
    }
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        backButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        containerView.addSubview(contentLabel)
        contentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        contentLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14).isActive = true
        
        containerView.addSubview(scrollView)
//        scrollView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 12).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
//        scrollView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 9/17).isActive = true
        scrollView.frame = CGRect(x: 0, y: 60, width: 414, height: 220)
        
        containerView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -4).isActive = true
    }
    
    func setupScrollView() {
        let width:CGFloat = 414
        let height:CGFloat = 414 * 9/17
        for i in 0..<images.count {
            let image = UIImageView(frame: CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height))
            image.image = UIImage(named: images[i])
            image.contentMode = .scaleAspectFill
            scrollView.addSubview(image)
        }
        
        scrollView.contentSize = CGSize(width: width * CGFloat(images.count), height: height)
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
           pageControl.currentPage = Int(pageIndex)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "inforCell", for: indexPath) as! CustomInforCell
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomTableViewCell
        
        cell1.name.text = datas[indexPath.row].name
        cell1.number.text = datas[indexPath.row].number
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 //UITableView.automaticDimension
    }
    
    
}
