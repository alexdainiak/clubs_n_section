//
//  ClubsAssembly.swift
//  Data
//
//  Created by 1 on 14.12.2020.
//

import Domain
import Swinject
import Moya

public class ClubsDataAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(ClubsRepository.self) { _ in
            return ClubsRepositoryImpl(provider: .init())
        }
    }
    
}
