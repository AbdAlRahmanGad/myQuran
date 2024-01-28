//
//  ChaptersList.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.
//

import SwiftUI

struct ChaptersList: View {
    
//    let Chapters : [String] = [
//    "الفاتحة", "البقرة", "آل عمران"
//    ]
//    let Juz : [Int] = [1,1,3]
//    let juz = 0
//    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {

//        CodableViewModel
        if let chapters = vm.chapterArray?.chapters,
           let juzs = vm.juzArray?.juzs{
            NavigationStack {
                List {
                    //// extract the views
                    ////// if new juz make header
                    ///if not do not call header
                    ///
                    /// State -> if selected borderColor and numberColor change <- ternary operator
                    
                    
                    ForEach(chapters) { chapter in
                        //                Section (
                        //                    header: Text("الجزء \(juz.juzNumber)")){
//                        NavigationLink(value: chapter.pages[0]) {
//                            listOfChapterView(chapter: chapter)
//                        }
                        NavigationLink {
                            verseByVerseView(pageNumber: chapter.pages[0])
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            listOfChapterView(chapter: chapter)
                        }

                    }
                }.navigationTitle("الفهرس")
                  
            }.environment(\.layoutDirection, .rightToLeft)

        }
    }
}

#Preview {
    ChaptersList()
}

struct listOfChapterView: View {
    
    let chapter : Chapter
    var body: some View {
        HStack(){
            VStackLayout(alignment: .leading){
                Text("\(chapter.nameArabic)")
                    .foregroundStyle(Color("fontColor"))
                    .font(.title)
                    .bold()
                
                Text("رقمها \(chapter.id) _  آياتها \(chapter.versesCount) _ \(chapter.revelationPlace.rawValue == "madinah" ? "مدنية" : "مكية")")
                
                    .foregroundStyle(.gray)
                    .font(.caption)
                    .bold()
                
            }
            
            Spacer()

            
            
            //            ZStack(alignment: .center) {
            //
            //                Circle()
            //                    .frame(width: 40, height: 40, alignment: .center)
            //                    .foregroundStyle(.gray)
                            
                            
                            Text("\(chapter.pages[0])")
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundStyle(Color.white)
                                .font(.headline)
            //                    .padding(20)
                                .background {
                                    Circle()
                                        .frame(width: 45, height: 45, alignment: .center)
                                        .foregroundStyle(.gray)
                                }
                            //                .padding()
                            
                            
                          
            //            }
        }
    }
}
