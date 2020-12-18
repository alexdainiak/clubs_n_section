//
//  HomePageView.swift
//  Coordinators
//
//  Created by 1 on 15.12.2020.
//

import SwiftUI
import Domain
import RxSwift

struct HomePageView: View {
    
    @ObservedObject var viewModel: HomePageViewModel
    
    public var body: some View {
        NavigationView {
            List(viewModel.clubPreviewViewDatas) { viewData in
                NavigationLink(
                    destination: viewModel.detailsView(for: viewData.id),
                    label: {
                        
                        ClubPreView(viewData: viewData)
                        
                    }
                )
            }
            .onAppear {
                self.viewModel.loadClubs()
            }
            .navigationBarTitle("Clubs")
        }
    }
}
