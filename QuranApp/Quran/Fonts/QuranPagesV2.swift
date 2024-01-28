//
//  QuranPagesV2.swift
//  QuranTest-11
//
//  Created by abdo gad on 29/01/2024.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let quranPageV2 = try? JSONDecoder().decode(QuranPageV2.self, from: jsonData)

import Foundation

// MARK: - QuranPageV2
//struct QuranPagesV2: Codable{
//    let quranPageV2: [QuranPageV2]
//}

struct QuranPageV2: Codable{
    let verses: [Verse]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let perPage, currentPage: Int
    let nextPage: Int?
    let totalPages, totalRecords: Int

    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case totalPages = "total_pages"
        case totalRecords = "total_records"
    }
}

// MARK: - Verse
struct Verse: Codable, Identifiable {
    let id, verseNumber: Int
    let verseKey: String
    let hizbNumber, rubElHizbNumber, rukuNumber, manzilNumber: Int
    let sajdahNumber: Int?
    let textUthmani: String
    let chapterID: Int
    let codeV2, textImlaeiSimple: String
    let pageNumber, juzNumber: Int
    let words: [Word]

    enum CodingKeys: String, CodingKey {
        case id
        case verseNumber = "verse_number"
        case verseKey = "verse_key"
        case hizbNumber = "hizb_number"
        case rubElHizbNumber = "rub_el_hizb_number"
        case rukuNumber = "ruku_number"
        case manzilNumber = "manzil_number"
        case sajdahNumber = "sajdah_number"
        case textUthmani = "text_uthmani"
        case chapterID = "chapter_id"
        case codeV2 = "code_v2"
        case textImlaeiSimple = "text_imlaei_simple"
        case pageNumber = "page_number"
        case juzNumber = "juz_number"
        case words
    }
}

// MARK: - Word
struct Word: Codable, Identifiable {
    let id, position: Int
    let audioURL: String?
    let verseKey: String
    let verseID: Int
    let location, textUthmani, codeV2, qpcUthmaniHafs: String
    let charTypeName: CharTypeName
    let pageNumber, lineNumber: Int
    let text: String
    let translation, transliteration: Translation

    enum CodingKeys: String, CodingKey {
        case id, position
        case audioURL = "audio_url"
        case verseKey = "verse_key"
        case verseID = "verse_id"
        case location
        case textUthmani = "text_uthmani"
        case codeV2 = "code_v2"
        case qpcUthmaniHafs = "qpc_uthmani_hafs"
        case charTypeName = "char_type_name"
        case pageNumber = "page_number"
        case lineNumber = "line_number"
        case text, translation, transliteration
    }
}

enum CharTypeName: String, Codable {
    case end = "end"
    case word = "word"
}

// MARK: - Translation
struct Translation: Codable {
    let text: String?
    let languageName: LanguageName
    let languageID: Int

    enum CodingKeys: String, CodingKey {
        case text
        case languageName = "language_name"
        case languageID = "language_id"
    }
}

// enum LanguageName: String, Codable {
//    case english = "english"
//}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
