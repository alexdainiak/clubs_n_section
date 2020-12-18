//
//  SecondSectionCoordinatorAssembly.swift
//  Coordinators
//
//  Created by 1 on 14.12.2020.
//

import Swinject

final class SecondSectionCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(SecondSectionCoordinator.self) { _ in
            
            return SecondSectionCoordinator()
            
        }
    }
    
}
