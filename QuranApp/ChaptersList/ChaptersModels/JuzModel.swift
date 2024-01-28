//
//  JuzModel.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let juzs = try? JSONDecoder().decode(Juzs.self, from: jsonData)

import Foundation

// MARK: - Juzs
struct Juzs: Codable{
    let juzs: [Juz]
}

// MARK: - Juz
struct Juz: Codable, Identifiable {
    let id, juzNumber: Int
    let verseMapping: [String: String]
    let firstVerseID, lastVerseID, versesCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case juzNumber = "juz_number"
        case verseMapping = "verse_mapping"
        case firstVerseID = "first_verse_id"
        case lastVerseID = "last_verse_id"
        case versesCount = "verses_count"
    }
}
