//
//  DomainError.swift
//  Data
//
//  Created by 1 on 13.12.2020.
//

import AppFoundation

public struct DomainError<ErrorCode>: HierarchyError
where
    ErrorCode: RawRepresentable,
    ErrorCode.RawValue == Int
{
    
    // MARK: - Public properties
    
    public var errorCode: String {
        return String(code.rawValue)
    }
    
    public var parentHierarchyError: HierarchyError?

    public let code : ErrorCode
    public let message: String
    
    // MARK: - Init
    
    public init(
        code: ErrorCode,
        message: String,
        parentHierarchyError: HierarchyError?
    ) {
        self.code = code
        self.message = message
        self.parentHierarchyError = parentHierarchyError
    }
}
