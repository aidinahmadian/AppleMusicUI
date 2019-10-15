//
//  SignInViewController.swift
//  Artists
//
//  Created by aidin ahmadian on 10/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class PlaylistsViewController: UIViewController {
    
    let albumArtworkLists = ArtworksAPI.getLists()
    let cellId = "PlaylistViewCellID"
    
    lazy var PlaylistArtworksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
       let cvv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvv.dataSource = self
        cvv.delegate = self
        cvv.translatesAutoresizingMaskIntoConstraints = false
        return cvv
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Playlists"
        setupView()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    
    // MARK: Setup Functions/Constraints
    
    
    func setupView() {
        view.addSubview(PlaylistArtworksCollectionView)
        PlaylistArtworksCollectionView.register(ArtworksCollectionView.self, forCellWithReuseIdentifier: cellId)
        PlaylistArtworksCollectionView.backgroundColor = .white
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":PlaylistArtworksCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v1]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1":PlaylistArtworksCollectionView]))
    }
}
