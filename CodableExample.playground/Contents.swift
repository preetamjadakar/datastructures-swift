import UIKit

///public typealias Codable = Decodable & Encodable

/// Basic Codable example, No need of cases
let json = """
[
    {
        "name": "Paul",
        "age": 38
    },
    {
        "name": "Andrew",
        "age": 40
    }
]
"""

let data = Data(json.utf8)

struct User: Codable {
    var name: String
    var age: Int
}

let decoder = JSONDecoder()

do {
    let decoded = try decoder.decode([User].self, from: data)
    print(decoded[0])
} catch {
    print("Failed to decode JSON")
}

///A common problem with JSON is that it will use different formatting for its key names than we want to use in Swift.
///If we need new key names
let json2 = """
[
    {
        "first_name": "Paul",
        "last_name": "Hudson"
    },
    {
        "first_name": "Andrew",
        "last_name": "Carnegie"
    }
]
"""

let data2 = Data(json2.utf8)

struct User2: Codable {
    var firstName: String
    var lastName: String
}
let decoder2 = JSONDecoder()
decoder2.keyDecodingStrategy = .convertFromSnakeCase

do {
    let decoded = try decoder2.decode([User2].self, from: data2)
    print(decoded[0])
} catch {
    print("Failed to decode JSON2")
}

///Mapping different key names
///If you have JSON keys that are completely different from your Swift properties, you can map them using a CodingKeys enum.

let json3 = """
[
    {
        "user_first_name": "Taylor",
        "user_last_name": "Swift",
        "user_age": 26
    }
]
"""
let data3 = Data(json3.utf8)

struct User3: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "user_first_name"
        case lastName = "user_last_name"
        case age = "user_age"
    }
}
///Note: The enum is called CodingKeys and the protocol is called CodingKey.

let decoder3 = JSONDecoder()
//decoder3.keyDecodingStrategy = .convertFromSnakeCase
do {
    let decoded = try decoder3.decode([User3].self, from: data3)
    print(decoded[0])
} catch {
    print("Failed to decode JSON3", error)
}

///Nested JSON
let json4 = """
[
    {
        "name": {
            "first_name": "Taylor",
            "last_name": "Swift"
        },
        "age": 26
    }
]
"""

let data4 = Data(json4.utf8)

struct User4: Decodable {
    let age: Int
    let fullName: String?
    enum CodingKeys: String, CodingKey {
        case age
        case firstName = "first_name"
        case lastName = "last_name"
        case name
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        age = try container.decode(Int.self, forKey: .age)
        let nameContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .name)
        let firstName = try nameContainer.decode(String.self, forKey: .firstName)
        let lastName = try nameContainer.decode(String.self, forKey: .lastName)
        fullName = firstName + " " + lastName
    }
}
struct User5: Decodable {
    struct Employee: Decodable {
        let first_name: String
        let last_name: String
    }
    let age: Int
    let name: Employee
}
let decoder4 = JSONDecoder()
do {
    let decoded = try decoder4.decode([User4].self, from: data4)
    print(decoded[0])
} catch {
    print("Failed to decode JSON4", error)
}
do {
    let decoded = try decoder4.decode([User5].self, from: data4)
    print(decoded[0].name)
} catch {
    print("Failed to decode JSON5", error)
}
