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
    
    func loadCountries() {
        Connection.fetchData(url: RequestLinksUtil().getData(en: "getAllCountries")) { (response) in
            do {
               let countries = try JSONDecoder().decode(VCCountries.self, from: response)
                for ct in countries {
                    self.saveCountryOnCoreData(currentCountry: ct)
                }
            } catch {
                print(error)
            }            
        }
    }
    
    func getAllCountries() {
        guard let model = managedContext.persistentStoreCoordinator?.managedObjectModel, let fetch = model.fetchRequestTemplate(forName: "allCountries") as? NSFetchRequest<Country> else {
            return
        }
        do {
            arrayOfCountries = try managedContext.fetch(fetch)
        } catch let error as NSError {
            print("Error when try fetch all opportunities " + error.description)
        }
        
    }
    
    func saveCountryOnCoreData(currentCountry: VCCountry) {
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
        country.regionalBlocs = (currentCountry.regionalBlocs! as NSObject)
        country.cioc = currentCountry.cioc
        for currency in currentCountry.currencies! {
            let crEntity = NSEntityDescription.entity(forEntityName: "Currency", in: managedContext)
            let cr = Currency(entity: crEntity!, insertInto: managedContext)
            cr.code = currency.code ?? ""
            cr.name = currency.name ?? ""
            cr.symbol = currency.symbol ?? ""
            country.addToRelationship(cr)
        }
        for language in currentCountry.languages! {
            let langEntity = NSEntityDescription.entity(forEntityName: "Language", in: managedContext)
            let lang = Language(entity: langEntity!, insertInto: managedContext)
            lang.iso639_1 = language.iso6391
            lang.iso639_2 = language.iso6392
            lang.name = language.nativeName
            lang.nativeName = language.nativeName
            country.addToRelationship1(lang)
        }
        let translationEntity = NSEntityDescription.entity(forEntityName: "Translations", in: managedContext)
        let translation = Translations(entity: translationEntity!, insertInto: managedContext)
        translation.br = currentCountry.translations?.br
        country.addToRelationship2(translation)
        for regionalBloc in currentCountry.regionalBlocs! {
            let rbEntity = NSEntityDescription.entity(forEntityName: "RegionalBloc", in: managedContext)
            let rb = RegionalBloc(entity: rbEntity!, insertInto: managedContext)
            rb.acronym = regionalBloc.acronym
            rb.name = regionalBloc.name
            rb.otherAcronyms = (regionalBloc.otherAcronyms! as NSObject)
            rb.otherNames  = (regionalBloc.otherNames! as NSObject)
            country.addToRelationship3(rb)
        }
        CoreDataStack().saveContext()
    }
}
