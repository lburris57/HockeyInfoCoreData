//
//  APIService.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//
import Foundation
import SwiftUI

struct APIService
{
    let userId = Constants.USER_ID
    
    let urlString: String

    //  Returns the populated model object based on the decoded JSON data retrieved from the URL.  The DateDecodingStrategy and KeyDecodingStrategy have default values.
    func getJSON<T: Decodable>(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T
    {
        //  Verify the URL
        guard let url = URL(string: urlString) else
        {
            throw APIError.invalidURL
        }
        
        do
        {
            //  Create a request based on the URL
            var request = URLRequest(url: url)
            
            //  Add authentication data to the request
            request.addValue("Basic " + userId.toBase64()!, forHTTPHeaderField: "Authorization")
            
            //  Make the call to the URL with the request
            let (data, response) = try await URLSession.shared.data(for: request)
            
            //  Verify that the response is valid and the status code 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else
            {
                throw APIError.invalidResponseStatus
            }
            
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            
            //  Decode the JSON and return the populated model object
            do
            {
                let decodedData = try decoder.decode(T.self, from: data)
                
                return decodedData
            }
            catch
            {
                throw APIError.decodingError(error.localizedDescription)
            }
        }
        catch
        {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
}

enum APIError: Error, LocalizedError
{
    case invalidURL
    case invalidResponseStatus
    case dataTaskError(String)
    case corruptData
    case decodingError(String)

    var errorDescription: String?
    {
        switch self
        {
            case .invalidURL:
                return NSLocalizedString("The endpoint URL is invalid", comment: "")
            case .invalidResponseStatus:
                return NSLocalizedString("The API failed to issue a valid response.", comment: "")
            case let .dataTaskError(string):
                return string
            case .corruptData:
                return NSLocalizedString("The data provided appears to be corrupt", comment: "")
            case let .decodingError(string):
                return string
        }
    }
}
