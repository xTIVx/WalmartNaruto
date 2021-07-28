//
//  APIHandler.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import Foundation


class APIHandler {

    // Singleton
    static let shared = APIHandler()
    private init() {}


    /// Universal method to build URL based in endpoint and additional parameters
    /// - Parameters:
    ///   - endPoint: Type of URL, check EndPoints file
    ///   - params: Additional parameters for query part of URL
    /// - Returns: Request-Ready URL
    private func createURL(endPoint: EndPoints, params: [QueryParams:String]) -> URL? {
        guard let component = endPointList[endPoint] else { return nil }
        var components = URLComponents()
        components.scheme = component.scheme
        components.host = component.host
        components.path = component.path
        components.queryItems = component.query
        if !params.isEmpty {
            params.forEach {components.queryItems?.append(URLQueryItem(name: $0.rawValue, value: $1))}
        }
        guard let url = components.url else {
            print("Error: cannot create URL")
            return nil
        }
        return url
    }


    /// Universal method for create request to remote server
    /// - Parameters:
    ///   - endPoint: Type of URL, check EndPoints file
    ///   - params: Additional parameters for query part of URL
    ///   - completion: Results of request parsed with EpisodeResult Model
    func requestData<T>(type: T.Type, endPoint: EndPoints, params: [QueryParams:String], completion: @escaping (T?) -> ()) where T:Codable {

        guard let url = createURL(endPoint: endPoint, params: params) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, err in
            guard let data = data else {
                if let err = err {
                    print(err.localizedDescription)
                }
                return
            }
            completion(self?.decodeData(data: data, type: type))
        }.resume()
    }


    /// Data JSON parser
    /// - Parameter data: data with JSON
    /// - Returns: parsed object as EpisodeResult Model
    private func decodeData<T>(data: Data, type: T.Type) -> T? where T:Codable {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type.self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
