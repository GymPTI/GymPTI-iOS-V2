//
//  HomeCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture

public struct Home: ReducerProtocol {
    
  public struct State: Equatable {
    var paths: [String] = []
  }

  public enum Action: Equatable {
    case tabButton
  }

  @Dependency(\.sideEffect.home) var sideEffect

  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
          
      case .tabButton:
          sideEffect.tabButton()
          return .none
      }
    }
  }
}
