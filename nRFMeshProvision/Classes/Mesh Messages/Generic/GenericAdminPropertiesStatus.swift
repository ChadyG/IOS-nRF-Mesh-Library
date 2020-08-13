//
//  GenericAdminPropertiesStatus.swift
//  nRFMeshProvision
//
//  Created by Chad Godsey on 8/13/20.
//

import Foundation

public struct GenericAdminPropertiesStatus: GenericMessage {
    public static var opCode: UInt32 = 0x47
    
    public var parameters: Data? {
        return Data(fromArray: propertyIds)
    }
    
    public let propertyIds: [UInt16]
    
    /// Creates the Generic Admin Properties Status message.
    ///
    ///   - propertyId: The property IDs
    public init(_ propertyIds: [UInt16]) {
        self.propertyIds = propertyIds
    }
    
    public init?(parameters: Data)
    {
        propertyIds = parameters.toArray(type: UInt16.self)
    }
}
