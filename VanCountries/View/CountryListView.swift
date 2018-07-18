//
//  ViewController.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class CountryListView: UITableViewController {
    
    let countryViewModel = CountryViewModel()
    
    var overlayView = UIView()
    var activityIndicator: UIActivityIndicatorView!
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        tableView.delegate = self
        tableView.dataSource = self
        countryViewModel.loadCountries()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.arrayOfCountries.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryListViewCell") as! CountryListViewCell
        //cell.accessoryType = .none
        //cell.tagLabel.text = tagViewModel.tags[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CountryListViewCell
       
    }
}

extension CountryListView: CountriesListDelegate {
    func didFinishLoading() {
        tableView.reloadData()
    }
    
    func didFailLoading() {
        print("kjdajdbdjnjskdaskdksadjksdjska")
    }
    
    
}

extension CountryListView: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.isActive {
            //tagViewModel.getTags()
        } else {
            guard let term = searchController.searchBar.text else {
                return
            }
            if !term.isEmpty {
                //tagViewModel.serchTag(string: term.uppercased())
            }
        }
        tableView.reloadData()
    }
}

extension CountryListView {
    
    func configureSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search tags..."
        searchController.searchBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        searchController.searchBar.barStyle = .blackOpaque
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true
    }
    
    func addRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Updating countries list", attributes: [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1) ])
        tableView.refreshControl?.addTarget(self, action: #selector(loadCountries), for: .valueChanged)
    }
    
    @objc func loadCountries() {
        title = "OK"
        countryViewModel.loadCountries()
    }
    
    func loadActivityIndicator(){
        self.overlayView = UIView(frame: self.view.bounds)
        self.overlayView.alpha = 0
        self.overlayView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        self.activityIndicator.alpha = 1.0;
        self.activityIndicator.center = self.view.center;
        self.activityIndicator.hidesWhenStopped = true;
        self.overlayView.addSubview(activityIndicator)
        self.view.addSubview(overlayView)
        self.view.bringSubview(toFront: overlayView)
        UIView.animate(withDuration: 0.9, delay: 0.1,  options: .curveEaseIn, animations: {
            self.overlayView.alpha = 0.6
        }, completion: nil)
        self.activityIndicator.startAnimating()
    }
    
    func removeActivityIndicator() {
        UIView.animate(withDuration: 0.5, delay: 0.1,  options: .curveEaseOut, animations: {
            self.overlayView.alpha = 0
        }) { (ok) in
            self.overlayView.removeFromSuperview()
        }
    }
}
