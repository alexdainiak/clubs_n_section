//
//  FirebaseApiTarget.swift
//  Network
//
//  Created by __ on 12/13/20.
//

import Moya

public protocol FirebaseApiTarget: BasicTarget {
}

public extension FirebaseApiTarget {
    
    var baseURL: URL {
        var urlComponents = URLComponents(string: "https://children-clubs-and-sections-default-rtdb.europe-west1.firebasedatabase.app/")!
        urlComponents.queryItems = [
            URLQueryItem(name: "auth", value: "w6QkKXHoO37D6ENkl2OcGTxuiziT7EWQqDK32D3P")
        ]

        return urlComponents.url!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
}
