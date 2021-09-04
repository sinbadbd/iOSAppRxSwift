//
//  List.swift
//  List
//
//  Created by Imran on 20/8/21.
//  Copyright © 2021 SHUBHAM AGARWAL. All rights reserved.
//

import Foundation
 

// MARK: - Welcome
public struct ListModel: Codable {
    let status: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let type, responseLanguage: String?
    let attribute: Attribute?
}

// MARK: - Attribute
struct Attribute: Codable {
    let getCards: [GetCard]?
    let partners, partnersLast: [PartnersLastElement]?
    let showCategory: Int?
}

// MARK: - GetCard
struct GetCard: Codable {
    let title, type: String?
    let featured, id, autoSlider: Int?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let link: String?
    let isAccess: Int?
    let image: Image?
    let linkInApp: Int?
    let consentPopUpForCharging: ConsentPopUpForCharging?
    let multiButton: [MultiButton]?
    let shakeNwinButton: [ShakeNwinButton]?

    enum CodingKeys: String, CodingKey {
        case link, isAccess, image
        case linkInApp
        case consentPopUpForCharging, multiButton, shakeNwinButton
    }
}

// MARK: - ConsentPopUpForCharging
struct ConsentPopUpForCharging: Codable {
    let title: Title?
    let consentPopUpForChargingDescription: String?

    enum CodingKeys: String, CodingKey {
        case title
        case consentPopUpForChargingDescription
    }
}

enum Title: String, Codable {
    case redirecting = "Redirecting"
    case telenorZay = "Telenor Zay"
}

// MARK: - Image
struct Image: Codable {
    let the2X, the3X: String?

    enum CodingKeys: String, CodingKey {
        case the2X
        case the3X
    }
}

// MARK: - MultiButton
struct MultiButton: Codable {
    let link: String?
    let buttonImage: Image?
}

// MARK: - ShakeNwinButton
struct ShakeNwinButton: Codable {
    let titleBefore, title, desc, summary: String?
    let summaryAfter: String?
    let link: String?
}

// MARK: - PartnersLastElement
struct PartnersLastElement: Codable {
    let categoryID: Int?
    let catName: String?
    let catImage: CatImage?
    let partner: [PartnerPartner]?

    enum CodingKeys: String, CodingKey {
        case categoryID
        case catName, catImage, partner
    }
}

// MARK: - CatImage
struct CatImage: Codable {
    let image2X, image3X: String?

    enum CodingKeys: String, CodingKey {
        case image2X
        case image3X
    }
}

// MARK: - PartnerPartner
struct PartnerPartner: Codable {
    let type: String?
    let partnerID: Int?
    let name: String?
    let link: String?
    let isExternal: Int?
    let partnerImage: PartnerImage?
    let consentPopUpForCharging: ConsentPopUpForCharging?
    let offerName, validity, claimText: String?

    enum CodingKeys: String, CodingKey {
        case partnerID
        case type,name, link, isExternal, partnerImage, consentPopUpForCharging, offerName, validity, claimText
    }
}

// MARK: - PartnerImage
struct PartnerImage: Codable {
    let image2X, image3X: String?
    let bannerImage2X, bannerImage3X: String?
    let logoImage2X, logoImage3X: String?

    enum CodingKeys: String, CodingKey {
        case image2X
        case image3X
        case bannerImage2X
        case bannerImage3X
        case logoImage2X
        case logoImage3X
    }
}
