//
//  AssemblyCoordinator.swift
//  Coordinator
//
//  Created by __ on 12.12.2020.
//

@_exported import Swinject

open class AssemblyCoordinator<ResultType>: BaseCoordinator<ResultType> {
    
    // MARK: - Public properties
    
    public var resolver: Resolver {
        assembler.resolver
    }
    
    var assembler: Assembler!
    
    // MARK: - Public methods
    
    open override func coordinate<T>(to coordinator: BaseCoordinator<T>) {
        if let coordinator = coordinator as? AssemblyCoordinator<T> {
            let childAssembler = Assembler(parentAssembler: assembler)
            childAssembler.apply(assemblies: coordinator.assemblies())
            coordinator.assembler = childAssembler
        }

        super.coordinate(to: coordinator)
    }
    
    open func assemblies() -> [Assembly] {
        []
    }
    
}
