//
//  ClubsServiceImpl.swift
//  Data
//
//  Created by 1 on 13.12.2020.
//

import Domain
import RxSwift
import Network
import AppFoundation

final public class ClubsRepositoryImpl: ClubsRepository {
    
    // MARK: - Private properties
    
    private let  provider: ClubsProvider
    
    // MARK: - Init
    
    public init(
        provider: ClubsProvider
    ) {
        self.provider = provider
    }
    
    public func getClubs(for page: Int) -> Single<[Club]> {
        provider
            .rx
            .request(.getClubs)
            .performMapping(
                valueType: ClubsDto.self,
                errorType: ApiErrorModel.self
            )
            .map { $0.asDomain() }
    }
}
