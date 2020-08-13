//
//  GenericUserPropertyStatus.swift
//  nRFMeshProxy
//
//  Created by Chad Godsey on 8/13/20.
//  Copyright © 2020 Chad Godsey. All rights reserved.
//

import Foundation

public struct GenericUserPropertyStatus: GenericMessage {
    public static var opCode: UInt32 = 0x4E
    
    public var parameters: Data? {
        return Data() + propertyId + userAccess + data
    }
    
    public let propertyId: UInt16
    public let userAccess: UInt8
    public let data: Data
    
    /// Creates the Generic User Property Status message.
    ///
    ///   - propertyId: The property ID
    public init(_ propertyId: UInt16) {
        self.propertyId = propertyId
        self.userAccess = 0x03
        self.data = Data()
    }
    
    /// Creates the Generic User Property Status message.
    ///
    /// - parameters:
    ///   - propertyId: The property ID
    ///   - userAccess: The user access level
    ///   - data: The value of the property
    public init(_ propertyId: UInt16, userAccess: UInt8, data: Data) {
        self.propertyId = propertyId
        self.userAccess = userAccess
        self.data = data
    }
    
    public init?(parameters: Data) {
        guard parameters.count >= 2 else {
            return nil
        }
        propertyId = parameters.read(fromOffset: 0)
        userAccess = parameters[2]
        data =  parameters.subdata(in: 3..<parameters.count)
    }
}
