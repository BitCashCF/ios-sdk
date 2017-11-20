//
//  OmiseGOError.swift
//  OmiseGO
//
//  Created by Mederic Petit on 9/10/2560 BE.
//  Copyright © 2560 OmiseGO. All rights reserved.
//

/// Represents a SDK error
///
/// - unexpected: An unexpected error has occured
/// - configuration: A configuration error has occured
/// - api: An API error has occured
/// - other: Other types of errors
public enum OmiseGOError: Error {
    case unexpected(message: String)
    case configuration(message: String)
    case api(apiError: APIError)
    case other(error: Error)

    public var message: String {
        switch self {
        case .unexpected(let message):
            return "unexpected error: \(message)"
        case .configuration(let message):
            return "configuration error: \(message)"
        case .other(let error as DecodingError):
            return "Decoding Error: \(error.localizedDescription) - \(error.failureReason ?? "")"
        case .other(let error):
            return "I/O error: \(error.localizedDescription)"
        case .api(let error):
            return error.description
        }
    }

    public var localizedDescription: String {
        return self.message
    }

}

extension OmiseGOError: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String { return self.message }
    public var debugDescription: String { return self.message }
}

extension OmiseGOError: LocalizedError {

    public var errorDescription: String {
        return self.message
    }

}