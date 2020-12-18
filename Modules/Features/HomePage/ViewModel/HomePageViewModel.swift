//
//  HomePageViewModel.swift
//  Coordinators
//
//  Created by 1 on 15.12.2020.
//

import SwiftUI
import Domain
import RxSwift

final class HomePageViewModel: ObservableObject {
    
    @Published var clubs: [Club] = []
    var clubPreviewViewDatas: [ClubPreView.Data] {
        clubs.map { $0.previewModel }
    }
    
    var clubDetailsViewCombiner: ((_ club: Club) -> AnyView)?
    
    var linkView: AnyView?
    
    private var clubsRepository: ClubsRepository
    
    public init(clubsRepository: ClubsRepository) {
        self.clubsRepository = clubsRepository
    }
    
    func loadClubs() {
        clubsRepository.getClubs(for: 2)
            .subscribe { [weak self] clubs in
                
                self?.clubs = clubs
                
            } onError: { error in
                
                print(error.localizedDescription)
                
            }
    }
    
    func detailsView(for id: String) -> AnyView {
        
        guard let club = clubs.first(where: { $0.id == id }) else {
            
            return AnyView(EmptyView())
            
        }
        
        return clubDetailsViewCombiner?(club) ?? AnyView(EmptyView())
        
    }
    
}

extension Club {
    var previewModel: ClubPreView.Data {
        ClubPreView.Data(
            id: id,
            name: name
        )
    }
}
            
extension HomePageViewModel: HomePageInput {
    var tabBarTitle: Text {
        Text("Главная")
    }
    
    var tabBarIcon: Image {
        Image("")
    }
}

extension HomePageViewModel: HomePageOutput {
    
}
