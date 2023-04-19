//
//  JsonObject.swift
//  My_Project
//
//  Created by SPURGE on 15/04/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

struct Welcome: Codable {
    let status: StatusClass
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let data: [Datum]
    let perPage, currentPage: Int
    let firstPageURL, lastPageURL, nextPageURL: String
    let prevPageURL: JSONNull?
    let lastPage, from, to: Int

    enum CodingKeys: String, CodingKey {
        case data
        case perPage = "per_page"
        case currentPage = "current_page"
        case firstPageURL = "first_page_url"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case prevPageURL = "prev_page_url"
        case lastPage = "last_page"
        case from, to
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id, key: String
    let category: Category
    let cid: JSONNull?
    let commitment: String
    let commitmentType: CommitmentType?
    let deadline, description: String
    let faqs, globalTags: [JSONAny]
    let isActive: Bool
    let lastposttime: Int
    let learningOutcomes: [String]
    let mainPID: Int
    let nativeTid, nativeUid: Int?
    let postcount: Int
    let preRequisites: [String]
    let projectImage: String
    let shortDescription, slug: String
    let status: DatumStatus
    let tasks: [Task]
    let tid, timestamp: Int
    let title: String
    let type: TypeEnum
    let uid, viewcount, publishedAt: Int
    let scorecardAssociationTime, scorecardID: Int?
    let scorecardTitle: String?
    let recruiter: Recruiter
    let macrodata: Macrodata
    let evaluatedCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case key = "_key"
        case category, cid, commitment
        case commitmentType = "commitment_type"
        case deadline, description, faqs, globalTags, isActive, lastposttime
        case learningOutcomes = "learning_outcomes"
        case mainPID = "mainPid"
        case nativeTid = "native_tid"
        case nativeUid = "native_uid"
        case postcount
        case preRequisites = "pre_requisites"
        case projectImage = "project_image"
        case shortDescription = "short_description"
        case slug, status, tasks, tid, timestamp, title, type, uid, viewcount, publishedAt, scorecardAssociationTime
        case scorecardID = "scorecardId"
        case scorecardTitle, recruiter, macrodata, evaluatedCount
    }
}

enum Category: String, Codable {
    case course = "Course"
    case event = "Event"
    case project = "Project"
    case selection = "Selection"
}

enum CommitmentType: String, Codable {
    case custom = "custom"
}

// MARK: - Macrodata
struct Macrodata: Codable {
    let applicantCount, pendingCount, reAsignedCount: Int

    enum CodingKeys: String, CodingKey {
        case applicantCount = "applicant_count"
        case pendingCount = "pending_count"
        case reAsignedCount = "reAsigned_count"
    }
}

// MARK: - Recruiter
struct Recruiter: Codable {
    let username: String
    let fullname: String?
    let userslug: String
    let picture: String
    let uid: Int
    let displayname, iconText, iconBgColor: String

    enum CodingKeys: String, CodingKey {
        case username, fullname, userslug, picture, uid, displayname
        case iconText = "icon:text"
        case iconBgColor = "icon:bgColor"
    }
}

enum DatumStatus: String, Codable {
    case published = "published"
}

// MARK: - Task
struct Task: Codable {
    let taskID: Int
    let taskTitle, taskDescription: String
    let status: TaskStatus
    let assets: [Asset]

    enum CodingKeys: String, CodingKey {
        case taskID = "task_id"
        case taskTitle = "task_title"
        case taskDescription = "task_description"
        case status, assets
    }
}

// MARK: - Asset
struct Asset: Codable {
    let assetID: Int
    let assetTitle, assetDescription: String
    let assetContent: String
    let assetType: AssetType
    let assetContentType: AssetContentType

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case assetTitle = "asset_title"
        case assetDescription = "asset_description"
        case assetContent = "asset_content"
        case assetType = "asset_type"
        case assetContentType = "asset_content_type"
    }
}

enum AssetContentType: String, Codable {
    case article = "article"
    case docs = "docs"
    case eaglebuilder = "eaglebuilder"
    case form = "form"
    case image = "image"
    case threadbuilder = "threadbuilder"
    case video = "video"
}

enum AssetType: String, Codable {
    case displayAsset = "display_asset"
    case inputAsset = "input_asset"
}

enum TaskStatus: String, Codable {
    case notworkyet = "notworkyet"
}

enum TypeEnum: String, Codable {
    case project = "project"
}

// MARK: - StatusClass
struct StatusClass: Codable {
    let code, message: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
