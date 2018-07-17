
//
//  VCTranslations.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class VCTranslation: Codable {
    let de, es, fr, ja: String?
    let it, br, pt, nl: String?
    let hr, fa: String?
    
    init(de: String?, es: String?, fr: String?, ja: String?, it: String?, br: String?, pt: String?, nl: String?, hr: String?, fa: String?) {
        self.de = de
        self.es = es
        self.fr = fr
        self.ja = ja
        self.it = it
        self.br = br
        self.pt = pt
        self.nl = nl
        self.hr = hr
        self.fa = fa
    }
}
