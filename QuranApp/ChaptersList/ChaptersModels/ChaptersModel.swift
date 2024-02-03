//
//  ChaptersModel.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.


import Foundation

struct Chapters: Codable {
    let chapters: [Chapter]
}

struct Chapter: Codable, Identifiable {
    let id: Int
    let revelationPlace: RevelationPlace
    let revelationOrder: Int
    let bismillahPre: Bool
    let nameSimple, nameComplex, nameArabic: String
    let versesCount: Int
    let pages: [Int]
    let translatedName: TranslatedName

    enum CodingKeys: String, CodingKey {
        case id
        case revelationPlace = "revelation_place"
        case revelationOrder = "revelation_order"
        case bismillahPre = "bismillah_pre"
        case nameSimple = "name_simple"
        case nameComplex = "name_complex"
        case nameArabic = "name_arabic"
        case versesCount = "verses_count"
        case pages
        case translatedName = "translated_name"
    }
}

enum RevelationPlace: String, Codable {
    case madinah = "madinah"
    case makkah = "makkah"
}

struct TranslatedName: Codable {
    let languageName: LanguageName
    let name: String

    enum CodingKeys: String, CodingKey {
        case languageName = "language_name"
        case name
    }
}

enum LanguageName: String, Codable {
    case english = "english"
}
