//
//  ApplicationCoordinatorAssembly.swift
//  Coordinators
//
//  Created by 1 on 14.12.2020.
//

import Swinject

final public class ApplicationCoordinatorAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(ApplicationCoordinator.self) { (resolver, assembler: Assembler) in
            
            let applicationCoordinator = ApplicationCoordinator(assembler: assembler)
            applicationCoordinator.homePageCoordinator = assembler.resolver.resolve(HomePageCoordinator.self)!
            applicationCoordinator.secondSectionCoordinator = assembler.resolver.resolve(SecondSectionCoordinator.self)!
            
            return applicationCoordinator
        }
    }
}
