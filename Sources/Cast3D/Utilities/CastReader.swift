import Foundation

public struct CastReader {
    let handle: FileHandle

    public init(_ file: URL) throws {
        self.handle = try FileHandle(forReadingFrom: file)
    }

    public func readRawHeader() throws -> RawHeader {
        try self.handle.seek(toOffset: 0)
        guard let header = try RawHeader(self.handle.read(bytes: MemoryLayout<RawHeader>.size)) else {
            try self.handle.seek(toOffset: 0)
            throw POSIXError(.EBADMSG)
        }
        return header
    }

    public func readRawNodeHeader() throws -> RawNodeHeader {
        let offset = try self.handle.offset()
        guard let header = try RawNodeHeader(self.handle.read(bytes: MemoryLayout<RawNodeHeader>.size)) else {
            try self.handle.seek(toOffset: offset)
            throw POSIXError(.EBADMSG)
        }
        return header
    }

    public func skipNode(header: RawNodeHeader) throws {
        var offset = try self.handle.offset()
        offset += UInt64(header.nodeSize) - UInt64(MemoryLayout<RawNodeHeader>.size)
        try self.handle.seek(toOffset: offset)
    }

    public func readRawPropertyHeader() throws -> RawPropertyHeader {
        let offset = try self.handle.offset()
        guard let header = try RawPropertyHeader(self.handle.read(bytes: MemoryLayout<RawPropertyHeader>.size)) else {
            try self.handle.seek(toOffset: offset)
            throw POSIXError(.EBADMSG)
        }
        return header
    }

    public func readRawProperty(header: RawPropertyHeader) throws -> RawProperty {
        let offset = try self.handle.offset()
        guard let name = try String(data: self.handle.read(bytes: Int(header.nameSize)), encoding: .utf8) else {
            try self.handle.seek(toOffset: offset)
            throw POSIXError(.EBADMSG)
        }

        do {
            switch header.identifier {
            case .byte:
                let size = Int(header.arrayLength)
                let values = try [UInt8](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .byte($0) })

            case .short:
                let size = Int(header.arrayLength)
                let values = try [UInt16](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .short($0) })

            case .integer32:
                let size = Int(header.arrayLength)
                let values = try [UInt32](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .integer32($0) })

            case .integer64:
                let size = Int(header.arrayLength)
                let values = try [UInt64](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .integer64($0) })

            case .float:
                let size = Int(header.arrayLength)
                let values = try [Float](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .float($0) })

            case .double:
                let size = Int(header.arrayLength)
                let values = try [Double](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .double($0) })

            case .string:
                var values = [String]()
                for _ in 0 ..< header.arrayLength {
                    try values.append(self.handle.readCString())
                }
                return RawProperty(header: header, name: name, values: values.map { .string($0) })

            case .vector2:
                let size = Int(header.arrayLength)
                let values = try [(Float, Float)](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .vector2($0) })

            case .vector3:
                let size = Int(header.arrayLength)
                let values = try [(Float, Float, Float)](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .vector3($0) })

            case .vector4:
                let size = Int(header.arrayLength)
                let values = try [(Float, Float, Float, Float)](unsafeUninitializedCapacity: size) { buffer, count in
                    try self.handle.read(into: UnsafeMutableRawBufferPointer(buffer))
                    count = size
                }
                return RawProperty(header: header, name: name, values: values.map { .vector4($0) })
            }
        } catch {
            try self.handle.seek(toOffset: offset)
            throw error
        }
    }

    public func skipProperty(header: RawPropertyHeader) throws {
        let offset = try self.handle.offset()
        do {
            switch header.identifier {
            case .byte:
                let size = UInt64(header.nameSize) + UInt64(header.arrayLength)
                try self.handle.seek(toOffset: offset + size)

            case .short:
                let size = UInt64(header.nameSize) + UInt64(header.arrayLength * 2)
                try self.handle.seek(toOffset: offset + size)

            case .integer32, .float:
                let size = UInt64(header.nameSize) + UInt64(header.arrayLength * 4)
                try self.handle.seek(toOffset: offset + size)

            case .integer64, .double, .vector2:
                let size = UInt64(header.nameSize) + UInt64(header.arrayLength * 8)
                try self.handle.seek(toOffset: offset + size)

            case .string:
                _ = try self.handle.read(bytes: Int(header.nameSize))
                for _ in 0 ..< header.arrayLength {
                    _ = try self.handle.readCString()
                }

            case .vector3:
                let size = UInt64(header.nameSize) + UInt64(header.arrayLength * 4 * 3)
                try self.handle.seek(toOffset: offset + size)

            case .vector4:
                let size = UInt64(header.nameSize) + UInt64(header.arrayLength * 4 * 4)
                try self.handle.seek(toOffset: offset + size)
            }
        } catch {
            try self.handle.seek(toOffset: offset)
            throw error
        }
    }

    public func readRawNode(header: RawNodeHeader) throws -> RawNode {
        var properties = [RawProperty]()
        for _ in 0 ..< header.propertyCount {
            let property = try self.readRawPropertyHeader()
            try properties.append(self.readRawProperty(header: property))
        }

        var children = [RawNode]()
        for _ in 0 ..< header.childCount {
            let child = try self.readRawNodeHeader()
            try children.append(self.readRawNode(header: child))
        }
        return RawNode(header: header, properties: properties, children: children)
    }

    public func readRawRootNodes(header: RawHeader) throws -> [RawNode] {
        var nodes = [RawNode]()
        for _ in 0 ..< header.rootNodes {
            let node = try self.readRawNodeHeader()
            try nodes.append(self.readRawNode(header: node))
        }
        return nodes
    }
}
