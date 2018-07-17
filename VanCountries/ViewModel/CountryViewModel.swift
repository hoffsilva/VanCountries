//
//  CountryViewModel.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

protocol CountriesListDelegate: class {
    /// Called when the request for countries list has loaded.
    func didFinishLoading()
    /// Called when the request for counties failed.
    func didFailLoading()
}

class CountryViewModel {
    
    weak var countriesListDelegate: CountriesListDelegate?
    typealias VCCountries = [VCCountry]
    
    func loadCountries() {
        Connection.fetchData(url: RequestLinksUtil().getData(en: "getAllCountries")) { (response) in
            do {
               let countries = try JSONDecoder().decode(VCCountries.self, from: response)
                for ct in countries {
                    print(ct)
                }
            } catch {
                print(error)
            }            
        }
    }
}
