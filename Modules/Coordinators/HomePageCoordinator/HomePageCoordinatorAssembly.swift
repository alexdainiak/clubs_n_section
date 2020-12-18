//
//  HomePageCoordinatorAssembly.swift
//  Coordinators
//
//  Created by 1 on 14.12.2020.
//

import Swinject

final class HomePageCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(HomePageCoordinator.self) { _ in
            
            return HomePageCoordinator()
            
        }
    }
    
}
