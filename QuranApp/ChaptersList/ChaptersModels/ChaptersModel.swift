//
//  ChaptersModel.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chapters = try? JSONDecoder().decode(Chapters.self, from: jsonData)

import Foundation

// MARK: - Chapters
struct Chapters: Codable {
    let chapters: [Chapter]
}

// MARK: - Chapter
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

// MARK: - TranslatedName
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
