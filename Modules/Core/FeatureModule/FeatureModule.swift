//
//  HierarchyError.swift
//  AppFoundation
//
//  Created by __ on 12/13/20.
//

import SwiftUI

public protocol FeatureModule: AnyObject {

    associatedtype Input

    associatedtype Output
    
    var view: AnyView { get }

    var input: Input { get }

    var output: Output { get }
}

open class BaseModule<Input, Output>: FeatureModule {

    // MARK: - Public
    
    public let view: AnyView
    public var output: Output
    public var input: Input

    // MARK: - Init
    
    public init(
        view: AnyView,
        input: Input,
        output: Output
    ) {
        self.view = view
        self.input = input
        self.output = output
    }
}
