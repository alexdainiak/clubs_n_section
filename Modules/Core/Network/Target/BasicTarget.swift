//
//  BasicTarget.swift
//  Network
//
//  Created by __ on 12/13/20.
//

import Moya


public protocol BasicTarget: TargetType {
    var timeout: TimeInterval { get }
}

public extension BasicTarget {
    var timeout: TimeInterval { 30 }
}
