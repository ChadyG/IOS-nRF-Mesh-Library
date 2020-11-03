//
//  GenericUserPropertySet.swift
//  nRFMeshProvision
//
//  Created by Chad Godsey on 8/13/20.
//

import Foundation

public struct GenericUserPropertySet: AcknowledgedGenericMessage {
    public static var opCode: UInt32 = 0x4C
    public static let responseType: StaticMeshMessage.Type = GenericUserPropertyStatus.self
    
    public var parameters: Data? {
        return Data() + propertyId + data
    }
    
    public let propertyId: UInt16
    public let data: Data
    
    
    /// Creates the Generic User Property Set message.
    ///
    ///   - propertyId: The property ID
    public init(_ propertyId: UInt16) {
        self.propertyId = propertyId
        self.data = Data()
    }
    
    /// Creates the Generic User Property Set  message.
    ///
    /// - parameters:
    ///   - propertyId: The property ID
    ///   - data: The value of the property
    public init(_ propertyId: UInt16, data: Data) {
        self.propertyId = propertyId
        self.data = data
    }
    
    public init?(parameters: Data) {
        guard parameters.count >= 2 else {
            return nil
        }
        propertyId = parameters.read(fromOffset: 0)
        data =  parameters.subdata(in: 2..<parameters.count)
    }
}
