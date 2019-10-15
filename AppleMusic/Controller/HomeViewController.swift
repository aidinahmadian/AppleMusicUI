//
//  ViewController.swift
//  Artists
//
//  Created by aidin ahmadian on 10/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class HomeViewController: UIViewController {
    
    let albumArtworkLists = ArtworksAPI.getLists()
    let cellId = "HomeViewCellID"
        
    let PlaylistsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Playlists", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(#colorLiteral(red: 1, green: 0.0941, blue: 0.3373, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(playlistsAction), for: .touchUpInside)
        return button
    }()
    
    let ArtistsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Artists", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(#colorLiteral(red: 1, green: 0.0941, blue: 0.3373, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(artistsAction), for: .touchUpInside)
        return button
    }()
    
    let AlbumsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Albums", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(#colorLiteral(red: 1, green: 0.0941, blue: 0.3373, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(albumAction), for: .touchUpInside)
        return button
    }()
    
    let SongsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Songs", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(#colorLiteral(red: 1, green: 0.0941, blue: 0.3373, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(songsAction), for: .touchUpInside)
        return button
    }()
    
    let recentlyPlayedLabel: UILabel = {
       let rpl = UILabel()
        rpl.text = "Recently Played"
        rpl.translatesAutoresizingMaskIntoConstraints = false
        rpl.textColor = .black
        rpl.font = UIFont.boldSystemFont(ofSize: 25)
        return rpl
    }()
    
    let EditButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(#colorLiteral(red: 1, green: 0.0941, blue: 0.3373, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .center
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var artworksCollectionView: UICollectionView = {
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
        navigationItem.title = "Library"
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        
        
    // MARK: Setup Button/Label Constraints
        
        
        PlaylistsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        PlaylistsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        PlaylistsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true

        ArtistsButton.topAnchor.constraint(equalTo: PlaylistsButton.bottomAnchor, constant: 10).isActive = true
        ArtistsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        ArtistsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true

        AlbumsButton.topAnchor.constraint(equalTo: ArtistsButton.bottomAnchor, constant: 10).isActive = true
        AlbumsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        AlbumsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true

        SongsButton.topAnchor.constraint(equalTo: AlbumsButton.bottomAnchor, constant: 10).isActive = true
        SongsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        SongsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        
        EditButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -45).isActive = true
        EditButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        EditButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        recentlyPlayedLabel.topAnchor.constraint(equalTo: SongsButton.bottomAnchor, constant: 10).isActive = true
        recentlyPlayedLabel.bottomAnchor.constraint(equalTo: artworksCollectionView.topAnchor, constant: -10).isActive = true
        recentlyPlayedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        recentlyPlayedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
    }
    
    
    // MARK: Setup Functions (Views and Constraints)
    
    
    func setupView() {
        view.addSubview(PlaylistsButton)
        view.addSubview(ArtistsButton)
        view.addSubview(AlbumsButton)
        view.addSubview(SongsButton)
        view.addSubview(recentlyPlayedLabel)
        view.addSubview(EditButton)
        view.addSubview(artworksCollectionView)
        artworksCollectionView.register(ArtworksCollectionView.self, forCellWithReuseIdentifier: cellId)
        artworksCollectionView.backgroundColor = .white
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-370-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1":artworksCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":artworksCollectionView]))
    }
    
    
    // MARK: Button Actions
    
    
    @objc func playlistsAction() {
        let PlaylistViewController = PlaylistsViewController()
        navigationController?.pushViewController(PlaylistViewController, animated: true)
    }
    
    
    @objc func albumAction() {
        let AlbumViewController = AlbumsViewController()
        navigationController?.pushViewController(AlbumViewController, animated: true)
    }
    
    @objc func artistsAction() {
        let ArtistViewController = ArtistsViewController()
        navigationController?.pushViewController(ArtistViewController, animated: true)
    }
    
    @objc func songsAction() {
        let SongViewController = SongsViewController()
        navigationController?.pushViewController(SongViewController, animated: true)
    }
    
}
