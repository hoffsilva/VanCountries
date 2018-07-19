//
//  SectionHeaderCollectionView.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 18/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class SectionHeaderCollectionView: UICollectionReusableView {
    
    @IBOutlet weak var labelSectionTitle: UILabel!
    
    var sectionTitle: String! {
        didSet {
            labelSectionTitle.text = sectionTitle
        }
    }
        
}
