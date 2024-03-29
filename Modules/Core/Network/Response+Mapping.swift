//
//  Response+Mapping.swift
//  Network
//
//  Created by __ on 12/13/20.
//

import Moya

public extension Moya.Response {
    
    func performMapping<Value, Error: Swift.Error>(
        valueMapping: @escaping Mapper<Value>,
        errorMapping: @escaping Mapper<Error>,
        mappingStrategy: @escaping MappingStrategy<Value, Error> = MappingStrategyCombiner.default()
    ) throws -> Value {
        return try mappingStrategy(self, valueMapping, errorMapping)
    }
    
    
    func performMapping<Value: Decodable, Error: Decodable & Swift.Error>(
        valueType: Value.Type,
        errorType: Error.Type,
        valueMapping: @escaping Mapper<Value> = Mapping.decode(Value.self),
        errorMapping: @escaping Mapper<Error> = Mapping.decode(
                                                            Error.self,
                                                            keyPath: "error"
                                                        ),
        mappingStrategy: @escaping MappingStrategy<Value, Error> = MappingStrategyCombiner.standard()
    ) throws -> Value {
        return try performMapping(
            valueMapping: valueMapping,
            errorMapping: errorMapping,
            mappingStrategy: mappingStrategy)
    }
}
