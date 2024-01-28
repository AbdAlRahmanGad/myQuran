//
//  ContentView.swift
//  QuranTest-11
//
//  Created by abdo gad on 28/01/2024.
//

import SwiftUI

struct verseByVerseView: View {
    
    @State var pageNumber: Int
    
    @State var juzNumber: Int = 1
    @State var chapterName: String = ""
    @State var prevJuzNumber: Int = 1
    @State var prevChapterName: String = ""
    @State var showToolBar: Bool = false
    
    
    @State var fontSize: CGFloat = 30

    

    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        NavigationStack{
            TabView(selection: $pageNumber){
                ForEach(1..<605) { index in
                    let quranPageV2 = vm.pagesV2[index-1]
                    
                    //// if on appear && on disappear on the same time
                    ///
                    ///
                    ///
                    ///
                    
                    ShowVerses(fontSize: $fontSize, pageNumber: index, page: quranPageV2)
                        .onAppear(perform: {
                            
                            prevJuzNumber = juzNumber
                            
                            juzNumber = quranPageV2.verses[0].juzNumber
                            
                            if let chapters = vm.chapterArray?.chapters{
                                
                                prevChapterName = chapterName
                                
                                chapterName = chapters[quranPageV2.verses[0].chapterID-1].nameArabic
                                
                            }
                        })
                        .onDisappear(perform: {
                            
//                            if(chapters[quranPageV2.verses[0].chapterID-1] != chapterName){
//                                chapterName = prevChapterName
//
//                            }
//                            chapterName = prevChapterName
//                            if(quranPageV2.verses[0].juzNumber != juzNumber){
//                                juzNumber = prevJuzNumber
//                            }
//                            juzNumber = prevJuzNumber
                        })
                       
                        .overlay {
                            Text("\(quranPageV2.verses[0].pageNumber)")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .background(
                                    Capsule(style: .circular)
                                        .fill(Color.gray)
                                    
                                )
                                .padding(50)
                                .padding(.bottom, 40)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottomTrailing)
                        }.tag(index)
                }
                
        //                                if(index != 603){
        //                                    Button("go to next page") {
        //                                        pageNumber = index+1
        //                                    }
        //                                }
                
     
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .environment(\.layoutDirection, .rightToLeft)
                .ignoresSafeArea(edges: .bottom)
                .toolbar(content: {
                    
                    if(!showToolBar){
                        ToolbarItem(placement: .topBarLeading) {
                            Text("الجزء \(juzNumber)")
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Text("\(chapterName)")
                        }
                    }else{
//                        ToolbarItem(placement: .topBarLeading) {
//                            Image(systemName: "gear")
//                        }
                   

                        ToolbarItem(placement: .topBarTrailing) {
                            menuFontSize()
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            indexToolBarItem()
             
                        }
//                        ToolbarItem(placement: .bottomBar) {
//                            ScrollView {
//                                HStack(spacing: 10) {
//                                    
//                                }
//                            }
//                        }
                    }
            
                })
                .onTapGesture {
                    showToolBar.toggle()
                }
        }.environment(\.layoutDirection, .rightToLeft)

    }
    
    func indexToolBarItem() -> some View {
        return NavigationLink {
            ChaptersList()
        } label: {
            Image(systemName: "list.dash")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(Color.gray)
        }
    }
    
    func menuFontSize() -> some View {
       return Menu {
            Stepper {
                Text("حجم الخط")
            } onIncrement: {
                if(fontSize < 54){
                    fontSize += 3
                }
            } onDecrement: {
                if(fontSize > 18){
                    fontSize -= 3
                }
            }

        } label: {
            Image(systemName: "textformat.size")
                .imageScale(.large)
                .environment(\.locale, .init(identifier: "ar"))
        }.environment(\.layoutDirection, .rightToLeft)
        
    }
    
    
    
}

#Preview {
   
    verseByVerseView(pageNumber: 1)
}

struct ShowVerses: View {
    @Binding var  fontSize: CGFloat
    var pageNumber: Int
    var page : QuranPageV2
//    @State var fullVerse : String


    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(page.verses) { verse in
                    
//                    ForEach(verse.words) { word in
//                        Text(concatV(verse: verse))
//                            .padding(.horizontal, 30)
//                            .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
//                            .font(Font.custom("QCF4001", size: fontSize, relativeTo: .title))
//                            .multilineTextAlignment(.trailing)

//                    }
                    if(verse.verseNumber == 1){
                        showChapterName(fontSize: fontSize, chapterNumber: verse.chapterID)
        
                        if(verse.chapterID != 1 && verse.chapterID != 9){
                        showBasmala(fontSize: fontSize)
                    }
                        
                    }
                    Text(verse.codeV2)
                            .padding(20)
//                            .foregroundStyle(.)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .font(Font.custom(getFontName(fonttype: "QCF2", pageNumber: pageNumber), size: fontSize, relativeTo: .title))
                            .multilineTextAlignment(.leading)
                            .environment(\.layoutDirection, .rightToLeft)
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
            .frame(width: UIScreen.main.bounds.width)
        }
//        .ignoresSafeArea(edges: .bottom)
        
    }

    
    func getFontName(fonttype: String , pageNumber: Int)-> String {
                            if(pageNumber < 10){
                              "\(fonttype)00\(pageNumber)"
                            }else if pageNumber < 100{
                              "\(fonttype)0\(pageNumber)"
                            }else{
                              "\(fonttype)\(pageNumber)"
                            }
    }
    func concatVerse (verse :Verse) -> String{
        var s: String = ""
            for v in verse.words{
                s.append(contentsOf: v.codeV2)
            }
        return s
    }
  
}
struct showBasmala: View {
    var  fontSize: CGFloat
    var body: some View {
        Text("ﲴﲮﲫﲪ")
            .padding(20)
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
            .font(Font.custom("QCF_FullSurah_HD", size: fontSize < 25 ? fontSize : 25, relativeTo: .title))
            .multilineTextAlignment(.center)
//            .environment(\.layoutDirection, .rightToLeft)

    }
}


struct showChapterName: View {
    var  fontSize: CGFloat
    var chapterNumber: Int
    @StateObject var vm = CodableViewModel()

    var body: some View {
        Text("\(vm.chapterNames[chapterNumber] ?? "ﮍ")")
            .padding(20)
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
            .font(Font.custom("QCF_FullSurah_HD", size: fontSize, relativeTo: .title))
            .multilineTextAlignment(.center)
            .environment(\.layoutDirection, .rightToLeft)
//            .foregroundStyle(.)

    }
}
