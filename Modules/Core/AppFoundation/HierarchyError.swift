//
//  HierarchyError.swift
//  AppFoundation
//
//  Created by __ on 12/13/20.
//

import Foundation

public protocol HierarchyError: Swift.Error {
    
    var parentHierarchyError: HierarchyError? { get }
    
    var domainError: String { get }
    
    var errorCode: String { get }
}


public extension HierarchyError {
    
    func getParent<ErrorType: HierarchyError>(
            searching type: ErrorType.Type
        ) -> ErrorType? {
            if let error = self as? ErrorType {
                return error
            } else {
                return parentHierarchyError?.getParent(searching: type)
            }
        }
        
        var domainError: String {
           return String(reflecting: type(of: self))
                .filter { String($0) == String($0).uppercased() }
                .replacingOccurrences(of: "_.", with: "")
        }
        
        var path: String {
            let path = domainError + "-" + errorCode
            
            if let parentError = parentHierarchyError {
                return path + " | " + parentError.path
            } else {
                return path
            }
        }
}
