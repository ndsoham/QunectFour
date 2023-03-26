//
//  PlaylistViewController.swift
//  QunectFour
//
//  Created by Soham Nagawanshi on 3/25/23.
//
import AVFoundation
import Foundation
import UIKit

class PlaylistViewController: UIViewController {
    // attributes
    private var tableView: UITableView = UITableView()
    var safeMargins: UILayoutGuide?
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        safeMargins = self.view.safeAreaLayoutGuide
        setupUI()
    }
}
//MARK: - set up the front end
extension PlaylistViewController {
    func setupUI() {
        if let safeMargins {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(PlaylistTableViewCell.self, forCellReuseIdentifier: PlaylistTableViewCell.identifier)
            self.view.addSubview(tableView)
            tableView.topAnchor.constraint(equalTo: safeMargins.topAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: safeMargins.leadingAnchor, constant: 10).isActive = true
            tableView.trailingAnchor.constraint(equalTo: safeMargins.trailingAnchor, constant: -10).isActive = true
            tableView.bottomAnchor.constraint(equalTo: safeMargins.bottomAnchor, constant: 10).isActive = true
        }
    }
}
//MARK: - deal with data source and delegate
extension PlaylistViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistTableViewCell.identifier) as! PlaylistTableViewCell
        cell.image = Constants.movies[indexPath.row].thumbnail
        cell.text = Constants.movies[indexPath.row].title
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//MARK: - configure the navigation bar
extension PlaylistViewController {
    func setupNavBar() {
        self.navigationItem.title = "Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
