//
//  DadataResponse.swift
//  ASDadataClient
//
//  Created by Alexander Shangin on 11.09.2023.
//

import Foundation

public struct DadataResponse: Decodable {
    public let suggestions: [DadataSuggestion]
}

public struct DadataSuggestion: Decodable {
    public let value: String
    public let unrestrictedValue: String
    public let data: DadataData
}

public struct DadataData: Decodable {
    public let name: String?
    public let patronymic: String?
    public let surname: String?
    public let gender: DadataGender?
}

public enum DadataGender: String, Decodable {
    case female = "FEMALE"
    case male = "MALE"
    case unknown = "UNKNOWN"
}
