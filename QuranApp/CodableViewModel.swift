//
//  CodableViewModel.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.
//

import Foundation



class CodableViewModel: ObservableObject {
    
    @Published var juzArray: Juzs? = nil
    @Published var chapterArray: Chapters? = nil
    @Published var quranPageV2: QuranPageV2? = nil
    @Published var pagesV2: [QuranPageV2] = [ ]

    init() {
        getData()
    }
    
    func getData() {
        
        guard let chapterData = readLocalJSONFile(forName: "ChapterList") else { return }
        self.chapterArray = try? JSONDecoder().decode(Chapters.self, from: chapterData)
        
        
        guard let juzData = readLocalJSONFile(forName: "JuzList") else { return }
        self.juzArray = try? JSONDecoder().decode(Juzs.self, from: juzData)
        for i in 1..<605 {
            guard let pageV2Data = readLocalJSONFile(forName: "page\(i)") else { return }
            
//                    do {
//                        self.quranPageV2 = try? JSONDecoder().decode(QuranPageV2.self, from: pageV2Data)
//                    } catch let error {
//                        print("Error decoding. \(error)")
//                    }
            self.quranPageV2 = try? JSONDecoder().decode(QuranPageV2.self, from: pageV2Data)
//            print(quranPageV2?.verses[0].pageNumber)

            self.pagesV2.append(self.quranPageV2!)
//            print(pagesV2[0])

        }




        

        
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    @Published var  chapterNames : Dictionary = [1: "ﱅ",
        2: "ﱆ",
        3: "ﱇ",
        4: "ﱊ",
        5: "ﱋ",
        6: "ﱎ",
        7: "ﱏ",
        8: "ﱑ",
        9: "ﱒ",
        10: "ﱓ",
        11: "ﱕ",
        12: "ﱖ",
        13: "ﱘ",
        14: "ﱚ",
        15: "ﱛ",
        16: "ﱜ",
        17: "ﱝ",
        18: "ﱞ",
        19: "ﱡ",
        20: "ﱢ",
        21: "ﱤ",
        22: "ﭑ",
        23: "ﭒ",
        24: "ﭔ",
        25: "ﭕ",
        26: "ﭗ",
        27: "ﭘ",
        28: "ﭚ",
        29: "ﭛ",
        30: "ﭝ",
        31: "ﭞ",
        32: "ﭠ",
        33: "ﭡ",
        34: "ﭣ",
        35: "ﭤ",
        36: "ﭦ",
        37: "ﭧ",
        38: "ﭩ",
        39: "ﭪ",
        40: "ﭬ",
        41: "ﭭ",
        42: "ﭯ",
        43: "ﭰ",
        44: "ﭲ",
        45: "ﭳ",
        46: "ﭵ",
        47: "ﭶ",
        48: "ﭸ",
        49: "ﭹ",
        50: "ﭻ",
        51: "ﭼ",
        52: "ﭾ",
        53: "ﭿ",
        54: "ﮁ",
        55: "ﮂ",
        56: "ﮄ",
        57: "ﮅ",
        58: "ﮇ",
        59: "ﮈ",
        60: "ﮊ",
        61: "ﮋ",
        62: "ﮍ",
        63: "ﮎ",
        64: "ﮐ",
        65: "ﮑ",
        66: "ﮓ",
        67: "ﮔ",
        68: "ﮖ",
        69: "ﮗ",
        70: "ﮙ",
        71: "ﮚ",
        72: "ﮜ",
        73: "ﮝ",
        74: "ﮟ",
        75: "ﮠ",
        76: "ﮢ",
        77: "ﮣ",
        78: "ﮥ",
        79: "ﮦ",
        80: "ﮨ",
        81: "ﮩ",
        82: "ﮫ",
        83: "ﮬ",
        84: "ﮮ",
        85: "ﮯ",
                                                 
        86: "ﮱ",
        87: "﮲",
        88: "﮴",
        89: "﮵",
        90: "﮷",
        91: "﮸",
        92: "﮺",
        93: "﮻",
        94: "﮽",
        95: "﮾",
        96: "﯀",
        97: "﯁",
        98: "ﯓ",
        99: "ﯔ",
        100: "ﯖ",
        101: "ﯗ",
        102: "ﯙ",
        103: "ﯚ",
        104: "ﯜ",
        105: "ﯝ",
        106: "ﯟ",
        107: "ﯠ",
        108: "ﯢ",
        109: "ﯣ",
        110: "ﯥ",
        111: "ﯦ",
        112: "ﯨ",
        113: "ﯩ",
        114: "ﯫ"
    ]

}


