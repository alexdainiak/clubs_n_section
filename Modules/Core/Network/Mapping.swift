//
//  Mapping.swift
//  Network
//
//  Created by __ on 12/13/20.
//

import Moya

public typealias Mapper<T> = (Moya.Response) throws -> T

public enum Mapping {}

public extension Mapping {
    
    static func decode<Value: Decodable>(
        _ type: Value.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        failsOnEmptyData: Bool = false
    ) -> Mapper<Value> {
        
        return { response in
            
            return try response.map(
                type,
                atKeyPath: keyPath,
                using: decoder,
                failsOnEmptyData: failsOnEmptyData
            )
        }
    }
}
