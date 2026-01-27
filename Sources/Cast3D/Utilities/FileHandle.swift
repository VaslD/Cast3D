import Foundation

extension FileHandle {
    func read(bytes: Int) throws -> Data {
        guard let data = try self.read(upToCount: bytes) else { throw POSIXError(.ENODATA) }
        guard data.count == bytes else {
            try self.seek(toOffset: self.offset() - UInt64(data.count))
            throw POSIXError(.ENODATA)
        }
        return data
    }

    func read(into buffer: UnsafeMutableRawBufferPointer) throws {
        guard let data = try self.read(upToCount: buffer.count) else { throw POSIXError(.ENODATA) }
        guard data.count == buffer.count else {
            try self.seek(toOffset: self.offset() - UInt64(data.count))
            throw POSIXError(.ENODATA)
        }
        let bytesRead = data.copyBytes(to: buffer)
        guard bytesRead == buffer.count else {
            try self.seek(toOffset: self.offset() - UInt64(data.count))
            throw POSIXError(.ENODATA)
        }
    }

    func readCString() throws -> String {
        let offset = try self.offset()
        var string = Data()
        repeat {
            do {
                // Repeatedly read 16 bytes, find 0x00, rollback read cursor
                guard let segment = try self.read(upToCount: 16), !segment.isEmpty else {
                    throw POSIXError(.ENODATA)
                }
                if let terminator = segment.firstIndex(of: 0x00) {
                    string += segment.prefix(terminator)
                    try self.seek(toOffset: self.offset() - UInt64(16 - terminator - 1))
                    break
                }
                string += segment
            } catch {
                try self.seek(toOffset: offset)
                throw error
            }
        } while true

        guard let result = String(data: string, encoding: .utf8) else {
            try self.seek(toOffset: offset)
            throw POSIXError(.EBADMSG)
        }
        return result
    }
}
