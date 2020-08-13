//
//  GenericUserPropertiesGet.swift
//  nRFMeshProvision
//
//  Created by Chad Godsey on 8/13/20.
//

import Foundation

public struct GenericUserPropertiesGet: AcknowledgedGenericMessage {
    public static var opCode: UInt32 = 0x822E
    public static let responseType: StaticMeshMessage.Type = GenericUserPropertiesStatus.self
    
    public var parameters: Data? {
        return nil
    }
    
    public init() {
        // Empty
    }
    
    public init?(parameters: Data) {
        guard parameters.isEmpty else {
            return nil
        }
    }
}
