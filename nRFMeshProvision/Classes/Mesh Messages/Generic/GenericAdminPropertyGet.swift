//
//  GenericAdminPropertyGet.swift
//  nRFMeshProvision
//
//  Created by Chad Godsey on 8/13/20.
//

import Foundation

public struct GenericAdminPropertyGet: AcknowledgedGenericMessage {
    public static var opCode: UInt32 = 0x822D
    public static let responseType: StaticMeshMessage.Type = GenericAdminPropertyStatus.self
    
    public var parameters: Data? {
        return Data() + propertyId
    }
    
    public let propertyId: UInt16
    
    /// Creates the Generic User Property Get message.
    ///
    ///   - propertyId: The property ID
    public init(_ propertyId: UInt16) {
        self.propertyId = propertyId
    }
    
    public init?(parameters: Data) {
        guard parameters.count == 2 else {
            return nil
        }
        propertyId = parameters.read(fromOffset: 0)
    }
}
