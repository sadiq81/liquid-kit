//
//  FileStorage.swift
//  LiquidKit
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import struct Foundation.Data

/// Liquid errors
public enum LiquidError: Swift.Error {
    /// key not exists error
    case keyNotExists
}

/// file storage protocol, must be implemented by the drivers
public protocol FileStorage {

    /// fs context
    var context: FileStorageContext { get }

    /// returns a key as a full url
    func resolve(key: String) -> String

    /// uploads the data under the given key
    func upload(key: String, data: Data) async throws -> String
    
    /// uploads the data under the given key
    func upload(key: String, buffer: ByteBuffer) async throws -> String

    /// return a file content for
    func getObject(key source: String) async throws -> Data?

    /// copy a file using a source key to a given destination key
    func copy(key: String, to: String) async throws -> String
    
    /// move a file using a source key to a given destination key
    func move(key: String, to: String) async throws -> String

    /// create a new directory for a given key
    func createDirectory(key: String) async throws
    
    /// list the contents of a given object for a key
    func list(key: String?) async throws -> [String]
    
    /// deletes the data under the given key
    func delete(key: String) async throws
    
    /// check if a given key exists
    func exists(key: String) async -> Bool
}
