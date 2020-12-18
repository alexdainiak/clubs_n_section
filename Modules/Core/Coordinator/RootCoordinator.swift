//
//  RootCoordinator.swift
//  Coordinator
//
//  Created by __ on 12.12.2020.
//

import Swinject

open class RootCoordinator: AssemblyCoordinator<Void> {
    
    public init(assembler: Assembler) {
        super.init()
        
        self.assembler = assembler
        assembler.apply(assemblies: assemblies())
    }
    
}
