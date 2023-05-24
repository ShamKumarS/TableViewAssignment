//
//  ViewController.swift
//  MagicTravel
//
//  Created by Rolan Marat on 1/21/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var citiesToVisitTableView: UITableView!
    
    // MARK: - Instance Properties
    private let citiesToVisit = ["Paris", "Tokyo", "Rome", "Cape Town", "New York", "Sydney", "Rio de Janeiro", "Moscow", "Buenos Aires", "Dubai"]
    private let cityCountryDict: [String: String] = [
        "Paris": "France",
        "Tokyo": "Japan",
        "Rome": "Italy",
        "Cape Town": "South Africa",
        "New York": "United States",
        "Sydney": "Australia",
        "Rio de Janeiro": "Brazil",
        "Moscow": "Russia",
        "Buenos Aires": "Argentina",
        "Dubai": "United Arab Emirates"
    ]

    struct Constants {
       static let cellIdentifier = "MagicCountryCell"
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesToVisitTableView.register(UITableViewCell.self,
                                    forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

// MARK: - UITableViewDataSource Methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return citiesToVisit.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = citiesToVisit[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = cityCountryDict[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        return tableViewCell
    }
}

// MARK: - UITableViewDelegate Methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let cityName = citiesToVisit[indexPath.row]
        let country: String = cityCountryDict[cityName, default: ""]
        print("City: ", cityName)
        print("Country: ", country)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
