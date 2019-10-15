//
//  CityCollectionViewCell.swift
//  Artists
//
//  Created by aidin ahmadian on 10/8/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class ArtworksCollectionView: UICollectionViewCell {
        
    var AlbumArtwork: Artworks? {

        didSet {
            guard let listItem = AlbumArtwork else {return}
            if let albumImages = listItem.albumImages {
                albumImage.image = UIImage(named: albumImages)
            }
            if let names = listItem.names {
                albumName.text = names
            }
        }
    }
    
    let albumImage: UIImageView = {
        let ci = UIImageView()
        ci.clipsToBounds = true
        ci.contentMode = .scaleAspectFill
        ci.layer.cornerRadius = 7
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
    let albumName: UILabel = {
       let cn = UILabel()
        cn.translatesAutoresizingMaskIntoConstraints = false
        cn.textColor = .darkGray
        cn.numberOfLines = 2
        cn.textColor = UIColor.darkGray
        cn.textAlignment = .left
        return cn
    }()

override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Setup Functions/Constraints
    
    
    func setupView() {
        addSubview(albumName)
        addSubview(albumImage)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":albumImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":albumName]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-[v1(25)]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":albumImage,"v1":albumName]))
    }
    
}
