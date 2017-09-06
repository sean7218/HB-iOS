//
//  BourbonCollectionViewCell.swift
//  XBourbon
//
//  Created by Sean Zhang on 9/6/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class BourbonCollectionViewCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "Bulleit Rye Kentucky Straight Bourbon"
        label.font = UIFont(name: "BodoniSvtyTwoITCTT-BookIta", size: 12)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.font = UIFont(name: "BodoniSvtyTwoITCTT-BookIta", size: 12)
        
        label.text = " $600.00/shot"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.font = UIFont(name: "BodoniSvtyTwoITCTT-BookIta", size: 12)
        label.text = " Rating: 569/755"
        return label
    }()
    
    let proofLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.font = UIFont(name: "BodoniSvtyTwoITCTT-BookIta", size: 12)
        label.text = " Proof: 90%"
        return label
    }()
    
    let tasteLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.font = UIFont(name: "BodoniSvtyTwoITCTT-BookIta", size: 12)
        label.text = "Tasting of this bourbon just feels right because of its exquisite aging method that was developed many many years ago."
        return label
    }()
    
    let bourbonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let starButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(#imageLiteral(resourceName: "Star"), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(#imageLiteral(resourceName: "Like"), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(#imageLiteral(resourceName: "Retweet"), for: .normal)
        return button
    }()
    
    let editButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(#imageLiteral(resourceName: "Reply"), for: .normal)
        return button
    }()
    
    fileprivate func setupButtonViews() {
        
        let v1 = UIView()
        v1.backgroundColor = .gray
        let v2 = UIView()
        v2.backgroundColor = .blue
        let v3 = UIView()
        v3.backgroundColor = .white
        let v4 = UIView()
        v4.backgroundColor = .purple
        
        let stackView = UIStackView(arrangedSubviews: [v1, v2, v3, v4])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        
        addSubview(stackView)
        addSubview(starButton)
        addSubview(likeButton)
        addSubview(retweetButton)
        addSubview(editButton)
        
        
        // define x, y, width, height of the subview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 5).isActive = true
        stackView.leftAnchor.constraint(equalTo: ratingLabel.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // define x, y, width, height of the subview
        starButton.translatesAutoresizingMaskIntoConstraints = false
        starButton.topAnchor.constraint(equalTo: v1.topAnchor, constant: 0).isActive = true
        starButton.leftAnchor.constraint(equalTo: v1.leftAnchor, constant: 0).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        // define x, y, width, height of the subview
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.topAnchor.constraint(equalTo: v2.topAnchor, constant: 0).isActive = true
        likeButton.leftAnchor.constraint(equalTo: v2.leftAnchor, constant: 0).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        // define x, y, width, height of the subview
        retweetButton.translatesAutoresizingMaskIntoConstraints = false
        retweetButton.topAnchor.constraint(equalTo: v3.topAnchor, constant: 0).isActive = true
        retweetButton.leftAnchor.constraint(equalTo: v3.leftAnchor, constant: 0).isActive = true
        retweetButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        retweetButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        // define x, y, width, height of the subview
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.topAnchor.constraint(equalTo: v4.topAnchor, constant: 0).isActive = true
        editButton.leftAnchor.constraint(equalTo: v4.leftAnchor, constant: 0).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
    }
    func setupViews() {
        
        //setting up the cell view
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(ratingLabel)
        addSubview(proofLabel)
        addSubview(tasteLabel)
        addSubview(bourbonImageView)
        setupButtonViews()
        
        // Setup button views
        
        
        // define x, y, width, height of the subview
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // define x, y, width, height of the subview
        bourbonImageView.translatesAutoresizingMaskIntoConstraints = false
        bourbonImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        bourbonImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        bourbonImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bourbonImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        // define x, y, width, height of the subview
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: bourbonImageView.bottomAnchor, constant: 10).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: bourbonImageView.rightAnchor, constant: 0).isActive = true
        
        // define x, y, width, height of the subview
        tasteLabel.translatesAutoresizingMaskIntoConstraints = false
        tasteLabel.topAnchor.constraint(equalTo: bourbonImageView.topAnchor, constant: 0).isActive = true
        tasteLabel.leftAnchor.constraint(equalTo: bourbonImageView.rightAnchor, constant: 10).isActive = true
        tasteLabel.bottomAnchor.constraint(equalTo: bourbonImageView.bottomAnchor, constant: 0).isActive = true
        tasteLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        // define x, y, width, height of the subview
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 0).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: tasteLabel.leftAnchor, constant: 0).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        // define x, y, width, height of the subview
        proofLabel.translatesAutoresizingMaskIntoConstraints = false
        proofLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 0).isActive = true
        proofLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        proofLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        proofLabel.leftAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: 10).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
