//
//  MoyaError + HierachyError.swift
//  Network
//
//  Created by __ on 12/13/20.
//

import AppFoundation
import Moya

extension MoyaError: HierarchyError {    
    
    /// Для того, чтобы реализовать это свойство на более низком уровне -
    /// необходимо подписать `AFError` протоколом `ComposableError`.
    /// Это точно то, что Вам необходимо? :)
    public var parentHierarchyError: HierarchyError? {
        return self.asAFError as? HierarchyError
    }
    
    /// Коды ошибок построены на основе аббревиатур видов ошибок MoyaError
    public var errorCode: String {
        let errorID: String
        switch self {
        case .imageMapping:
            errorID = "IM"
        case .jsonMapping:
            errorID = "JM"
        case .stringMapping:
            errorID = "SM"
        case .objectMapping:
            errorID = "OM"
        case .encodableMapping:
            errorID = "EM"
        case .statusCode:
            errorID = "SC"
        case .underlying:
            errorID = "U"
        case .requestMapping:
            errorID = "RM"
        case .parameterEncoding:
            errorID = "PM"
        }
        
        return "Moya-" + errorID
    }
}
