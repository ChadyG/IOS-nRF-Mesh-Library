//
//  GenericAdminPropertiesGet.swift
//  nRFMeshProvision
//
//  Created by Chad Godsey on 8/13/20.
//

import Foundation

public struct GenericAdminPropertiesGet: AcknowledgedGenericMessage {
    public static var opCode: UInt32 = 0x822C
    public static let responseType: StaticMeshMessage.Type = GenericAdminPropertiesStatus.self
    
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
