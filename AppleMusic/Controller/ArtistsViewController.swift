//
//  ArtistsViewController.swift
//  Artists
//
//  Created by aidin ahmadian on 10/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class ArtistsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let artistsLists = ArtistsAPI.getLists() // model
    let artistsTableView = UITableView() // view
    let cellId = "ArtistsCellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        artistsTableView.translatesAutoresizingMaskIntoConstraints = false
        artistsTableView.dataSource = self
        artistsTableView.delegate = self
        view.addSubview(artistsTableView)
        
        artistsTableView.register(ArtistsTableViewCell.self, forCellReuseIdentifier: cellId)
        navigationItem.title = "Artists"
        
        artistsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        artistsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        artistsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        artistsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArtistsTableViewCell
        cell.Artist = artistsLists[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: "http://www.mtv.com/music") {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
