//
//  DadataService.swift
//  ASDadataClient
//
//  Created by Alexander Shangin on 11.09.2023.
//

import Foundation

public final class DadataService {
    public static let shared = DadataService()
    
    private init() {}
    
    public func getNameSuggestions(
        apiKey: String,
        query: String,
        completion: @escaping (Result<[DadataSuggestion], Error>) -> Void
    ) {
        let urlString = Constants.baseUrl + "fio"
        let token = apiKey
        
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token \(token)"
        ]
        
        request.httpMethod = "POST"
        let queryData = ["query": query]
        let body = try! JSONSerialization.data(withJSONObject: queryData)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try jsonDecoder.decode(DadataResponse.self, from: data)
                    print(result)
                    
                    completion(.success(result.suggestions))
                } catch {
                    completion(.failure(error))
                }
                
            }
        }
        task.resume()
    }

    public func getAddressSuggestions(
        apiKey: String,
        query: String,
        completion: @escaping (Result<[DadataSuggestion], Error>) -> Void
    ) {
        let urlString = Constants.baseUrl + "address"
        let token = apiKey
        
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token \(token)"
        ]
        
        request.httpMethod = "POST"
        let queryData = ["query": query]
        let body = try! JSONSerialization.data(withJSONObject: queryData)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try jsonDecoder.decode(DadataResponse.self, from: data)
                    print(result)
                    
                    completion(.success(result.suggestions))
                } catch {
                    completion(.failure(error))
                }
                
            }
        }
        task.resume()
    }

    
}
