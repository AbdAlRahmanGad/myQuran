//
//  JuzModel.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.
//

import Foundation

struct Juzs: Codable{
    let juzs: [Juz]
}

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
