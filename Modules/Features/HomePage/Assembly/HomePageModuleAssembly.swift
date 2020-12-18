//
//  HomePageModuleAssembly.swift
//  Coordinators
//
//  Created by 1 on 15.12.2020.
//

import Swinject
import  Domain

public final class HomePageModuleAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(HomePageModule.self) { resolver in
            let clubsRepository = resolver.resolve(ClubsRepository.self)!
            let viewModel = HomePageViewModel(clubsRepository: clubsRepository)
            let view = HomePageView(viewModel: viewModel)
    
            return HomePageModule(
                view: .init(view),
                input: viewModel,
                output: viewModel
            )
        }
    }
    
    public init() {}
}
