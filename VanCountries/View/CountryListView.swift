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
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        
        loadActivityIndicator()
        countryViewModel.countriesListDelegate = self
        configureSearchBar()
        
        
        if UserDefaults.standard.bool(forKey: "Key") {
            countryViewModel.getAllCountries()
        } else {
            countryViewModel.loadCountries()
        }
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.arrayOfCountries.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryListViewCell") as! CountryListViewCell
        countryViewModel.selectCountry(indexpath: indexPath)
        cell.labelName.text = countryViewModel.selectedCountry.name
        cell.collectionVivewCurrencies.reloadData()
        cell.collectionVivewCurrencies.delegate = self
        cell.collectionVivewCurrencies.dataSource = self
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
//        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: (tableView.cellForRow(at: indexPath)?.frame.height)!))
//        backView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
//
//        let myImage = UIImageView(frame: backView.frame)
//        myImage.image = #imageLiteral(resourceName: "bomb.png")
//        myImage.contentMode = .scaleAspectFit
//
//        backView.addSubview(myImage)
        
        let delete = UITableViewRowAction(style: .destructive , title: nil) { (action, indexPath) in
            self.countryViewModel.arrayOfCountries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        
        //        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: (tableView.cellForRow(at: indexPath)?.frame.height)!))
        //        backView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        //
        //        let myImage = UIImageView(frame: backView.frame)
        //        myImage.image = #imageLiteral(resourceName: "bomb.png")
        //        myImage.contentMode = .scaleAspectFit
        //
        //        backView.addSubview(myImage)
        //
        //        let imgSize: CGSize = tableView.frame.size
        //        UIGraphicsBeginImageContextWithOptions(imgSize, false, UIScreen.main.scale)
        //        let context = UIGraphicsGetCurrentContext()
        //        backView.layer.render(in: context!)
        //        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        //        UIGraphicsEndImageContext()
        
        
        //        delete.backgroundColor = UIColor(patternImage: newImage)
        
        delete.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        delete.title = "💣"
        
        return [delete]
    }

}

extension CountryListView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return countryViewModel.getCurrenciesFrom(selectedCountry: countryViewModel.selectedCountry).count
        } else {
            return countryViewModel.getLanguagesFrom(selectedCountry: countryViewModel.selectedCountry).count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currencyCell", for: indexPath) as! CountryCurrenciesListViewCell
            cell.labelCurrency.text = countryViewModel.getCurrency(from: indexPath.row).name ?? ""
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currencyCell", for: indexPath) as! CountryCurrenciesListViewCell
            cell.labelCurrency.text = countryViewModel.getLanguage(from: indexPath.row).name ?? ""
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeaderView", for: indexPath) as! SectionHeaderCollectionView
        if indexPath.section == 0 {
            headerView.sectionTitle = "Currency"
        } else {
            headerView.sectionTitle = "Language"
        }
        return headerView
    }
}

extension CountryListView: CountriesListDelegate {
    func didFinishLoading() {
        //tableView.reloadData()
        removeActivityIndicator()
    }
    
    func didFailLoading() {
        print("erro")
    }
    
    
}

extension CountryListView: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.isActive {
            countryViewModel.getAllCountries()
        } else {
            guard let term = searchController.searchBar.text else {
                return
            }
            if !term.isEmpty {
                countryViewModel.searchCountry(by: term)
            }
        }
        tableView.reloadData()
    }
}

extension CountryListView {
    
    func configureSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search countries..."
        searchController.searchBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        searchController.searchBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchController.searchBar.barStyle = .default
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
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Updating countries list", attributes: [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) ])
        tableView.refreshControl?.addTarget(self, action: #selector(loadCountries), for: .valueChanged)
    }
    
    @IBAction func loadCountries() {
        loadActivityIndicator()
        countryViewModel.loadCountries()
    }
    
    func loadActivityIndicator(){
        tableView.isScrollEnabled = false
        self.overlayView = UIView(frame: self.view.frame)
        self.overlayView.alpha = 0
        self.overlayView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        self.activityIndicator.alpha = 1.0;
        self.activityIndicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        tableView.reloadData()
        tableView.isScrollEnabled = true
        UIView.animate(withDuration: 0.5, delay: 0.1,  options: .curveEaseOut, animations: {
            self.overlayView.alpha = 0
        }) { (ok) in
            self.overlayView.removeFromSuperview()
        }
    }
}
