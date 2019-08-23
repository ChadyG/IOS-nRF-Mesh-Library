//
//  GenericDefaultTransitionTimeStatus.swift
//  nRFMeshProvision
//
//  Created by Aleksander Nowakowski on 23/08/2019.
//

import Foundation

public struct GenericDefaultTransitionTimeStatus: GenericMessage {
    public static let opCode: UInt32 = 0x8210
    
    public var parameters: Data? {
        return Data([transitionTime.rawValue])
    }
    
    /// The Default Transition Time field identifies the default time that an
    /// element will take to transition to the target state from the present state.
    public let transitionTime: TransitionTime
    
    /// Creates the Generic Default Transition Time Status message.
    ///
    /// - parameter transitionTime: The default time that an element will take to transition
    ///                             to the target state from the present state.
    public init(transitionTime: TransitionTime) {
        self.transitionTime = transitionTime
    }
    
    public init?(parameters: Data) {
        guard parameters.count == 1 else {
            return nil
        }
        transitionTime = TransitionTime(rawValue: parameters[0])
    }
    
}
