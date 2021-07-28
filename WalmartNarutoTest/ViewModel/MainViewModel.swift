//
//  ViewModel.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import Foundation


class MainViewModel {

    // Object with all anime episodes
    var animesObject: [Anime]?
    var searchRequestText: String


    init(searchRequestText: String) {
        self.searchRequestText = searchRequestText
    }


    /// Universal method for fetch remote data
    /// - Parameters:
    ///   - endPoint: type of fetch, check Endpoints file for more info
    ///   - completion: Letting know when data is updated
    func fetchData(endPoint: EndPoints, completion:@escaping ([Anime]) -> ()) {
        APIHandler.shared.requestData(endPoint: endPoint, params: [.q: self.searchRequestText]) { animes in
            guard let animes = animes?.results else {return}
            self.animesObject = animes
            completion(animes)
        }
    }

    /// Using to get Anime object for every each cells
    /// - Parameter row: IndexPath.row
    /// - Returns: Anime object for cell
    func getAnimeForCell(at row: Int) -> Anime? {
        return animesObject?[row] ?? nil
    }

    /// Using to get number of rows for TableView
    /// - Returns: Count of elements from animesObject
    func getAnimesCount() -> Int {
        return animesObject?.count ?? 0
    }

}
