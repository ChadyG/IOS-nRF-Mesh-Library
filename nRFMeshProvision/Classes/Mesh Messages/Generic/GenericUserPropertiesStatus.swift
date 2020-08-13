//
//  GenericUserPropertiesStatus.swift
//  nRFMeshProvision
//
//  Created by Chad Godsey on 8/13/20.
//

import Foundation

public struct GenericUserPropertiesStatus: GenericMessage {
    public static var opCode: UInt32 = 0x4B
    
    public var parameters: Data? {
        return Data(fromArray: propertyIds)
    }
    
    public let propertyIds: [UInt16]
    
    /// Creates the Generic User Properties Status message.
    ///
    ///   - propertyId: The property ID
    public init(_ propertyIds: [UInt16]) {
        self.propertyIds = propertyIds
    }
    
    public init?(parameters: Data)
    {
        propertyIds = parameters.toArray(type: UInt16.self)
    }
}
