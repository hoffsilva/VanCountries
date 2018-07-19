
//
//  CountryViewModel.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import CoreData

protocol CountriesListDelegate: class {
    /// Called when the request for countries list has loaded.
    func didFinishLoading()
    /// Called when the request for counties failed.
    func didFailLoading()
}


class CountryViewModel {
    
    weak var countriesListDelegate: CountriesListDelegate?
    typealias VCCountries = [VCCountry]
    let managedContext = CoreDataStack().persistentContainer.viewContext
    var arrayOfCountries = [Country]()
    
    var selectedCountry =  Country()
    
    func getCurrenciesFrom(selectedCountry: Country) -> [Currency]  {
        return selectedCountry.currency?.allObjects as! [Currency]
    }
    
    func getLanguagesFrom(selectedCountry: Country) -> [Language] {
        return selectedCountry.language?.allObjects as! [Language]
    }
    
    func getLanguage(from index: Int) -> Language {
        return getLanguagesFrom(selectedCountry: selectedCountry)[index]
    }
    
    func getCurrency(from index: Int) -> Currency {
        return getCurrenciesFrom(selectedCountry: selectedCountry)[index]
    }
    
    func selectCountry(indexpath: IndexPath) {
        selectedCountry = arrayOfCountries[getIndex(indexpath: indexpath)]
    }
    
    func getIndex(indexpath: IndexPath) -> Int {
        return indexpath.row
    }
    
    // MARK - API - Get countries from API
    func loadCountries() {
        Connection.fetchData(url: RequestLinksUtil().getData(en: "getAllCountries")) { (response) in
            do {
                let countries = try JSONDecoder().decode(VCCountries.self, from: response)
                self.arrayOfCountries = []
                self.deleteAllCountries()
                for ct in countries {
                    self.saveCountryOnCoreData(currentCountry: ct)
                }
                UserDefaults.standard.set(true, forKey: "Key")
                self.countriesListDelegate?.didFinishLoading()
            } catch {
                print(error)
            }
        }
    }
    
    
    // MARK - COREDATA - Get all countries
    func getAllCountries() {
        guard let model = managedContext.persistentStoreCoordinator?.managedObjectModel, let fetch = model.fetchRequestTemplate(forName: "allCountries") as? NSFetchRequest<Country> else {
            return
        }
        do {
            arrayOfCountries.removeAll()
            arrayOfCountries = try managedContext.fetch(fetch)
            print(arrayOfCountries.count)
        } catch let error as NSError {
            print("Error when try fetch all opportunities " + error.description)
        }
       countriesListDelegate?.didFinishLoading()
    }
    
    // MARK - COREDATA - Delete all countries
    func deleteAllCountries() {
        var dataToDelete = [Country]()
        guard let model = managedContext.persistentStoreCoordinator?.managedObjectModel, let fetch = model.fetchRequestTemplate(forName: "allCountries") as? NSFetchRequest<Country> else {
            return
        }
        
        do {
            dataToDelete = try managedContext.fetch(fetch)
            for country in dataToDelete {
                managedContext.delete(country)
            }
            try managedContext.save()
        } catch let error as NSError {
            print("Error when try delete all opportunities " + error.description)
        }
    }
    
    func delete(country: Country) {
        managedContext.delete(country)
        do {
            try managedContext.save()
            getAllCountries()
            countriesListDelegate?.didFinishLoading()
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    func searchCountry(by name: String) {
        guard let model = managedContext.persistentStoreCoordinator?.managedObjectModel, let fetch = model.fetchRequestTemplate(forName: "allCountries") as? NSFetchRequest<Country> else {
            return
        }
        do {
            let countries = try managedContext.fetch(fetch)
            arrayOfCountries = []
            for country in countries {
                if (country.name?.contains(name))! {
                    arrayOfCountries.append(country)
                }
            }
            self.countriesListDelegate?.didFinishLoading()
        } catch let error as NSError {
            print("Error when try fetch all opportunities " + error.description)
        }
        
    }
    
    // MARK - COREDATA - Save countries
    func saveCountryOnCoreData(currentCountry: VCCountry) {
        var count = 0
        while count < 300 {
            count += 1
        }
        let country = NSEntityDescription.insertNewObject(forEntityName: "Country", into: managedContext) as! Country
        country.name = currentCountry.name
        country.topLevelDomain = currentCountry.topLevelDomain! as NSObject
        country.alpha2Code = currentCountry.alpha2Code
        country.alpha3Code = currentCountry.alpha3Code
        country.callingCodes = currentCountry.callingCodes! as NSObject
        country.capital = currentCountry.capital
        country.altSpellings = (currentCountry.altSpellings! as NSObject)
        country.region = currentCountry.region
        country.subregion = currentCountry.subregion
        country.population = Double(currentCountry.population!)
        country.latitude = (currentCountry.latlng?.first ?? 0.0)
        country.logitude = (currentCountry.latlng?.last ?? 0.0)
        country.demonym = currentCountry.demonym
        country.area = currentCountry.area ?? -1.0
        country.gini = currentCountry.gini ?? -1.0
        country.timezones = (currentCountry.timezones! as NSObject)
        country.borders = (currentCountry.borders! as NSObject)
        country.nativeName = currentCountry.nativeName
        country.numericCode = currentCountry.numericCode ?? ""
        country.flag = currentCountry.flag
        country.cioc = currentCountry.cioc
        for currency in currentCountry.currencies! {
            let crEntity = NSEntityDescription.entity(forEntityName: "Currency", in: managedContext)
            let cr = Currency(entity: crEntity!, insertInto: managedContext)
            cr.code = currency.code ?? ""
            cr.name = currency.name ?? ""
            cr.symbol = currency.symbol ?? ""
            country.addToCurrency(cr)
        }
        for language in currentCountry.languages! {
            let langEntity = NSEntityDescription.entity(forEntityName: "Language", in: managedContext)
            let lang = Language(entity: langEntity!, insertInto: managedContext)
            lang.iso639_1 = language.iso6391
            lang.iso639_2 = language.iso6392
            lang.name = language.nativeName
            lang.nativeName = language.nativeName
            country.addToLanguage(lang)
        }
        let translationEntity = NSEntityDescription.entity(forEntityName: "Translations", in: managedContext)
        let translation = Translations(entity: translationEntity!, insertInto: managedContext)
        translation.br = currentCountry.translations?.br
        country.addToRelationship2(translation)
        do {
            try managedContext.save()
            arrayOfCountries.append(country)
        } catch let error as NSError {
            print(error)
        }
    }
}
