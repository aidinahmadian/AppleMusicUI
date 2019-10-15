//
//  ViewController2.swift
//  Artists
//
//  Created by aidin ahmadian on 10/3/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class SongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let songsLists = SongsAPI.getLists() // model
    let songsTableView = UITableView() // view
    let cellId = "SongsCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Songs"
        view.backgroundColor = .white
        songsTableView.translatesAutoresizingMaskIntoConstraints = false
        songsTableView.dataSource = self
        songsTableView.delegate = self
        view.addSubview(songsTableView)
        
        songsTableView.register(SongsTableViewCell.self, forCellReuseIdentifier: cellId)
        
        songsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        songsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        songsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        songsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SongsTableViewCell
        cell.Song = songsLists[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .white
        footerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
        
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 10, width: view.frame.width - 80, height: 50)
        button.setTitle("Shuffle Play", for: .normal)
        button.setTitleColor( #colorLiteral(red: 0.9991746545, green: 0.1697836518, blue: 0.3347602487, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.9723946452, green: 0.9723150134, blue: 0.9887564778, alpha: 1)
        footerView.addSubview(button)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}
