import Foundation

struct Product: Codable {
    let name: String
    let type: [String : String?]
}

struct Package: Codable {
    let products: [Product]
}

guard let data = ProcessInfo.processInfo.environment["PACKAGE_JSON"]?.data(using: .utf8) else {
    fatalError("JSON Representation of Package was not delivered")
}
let decoded = try JSONDecoder().decode(Package.self, from: data)

if decoded.products.count == 1 {
    print(decoded.products[0].name)
} else if let firstExecutable = decoded.products.first(where: { $0.type.keys.contains("executable") }) {
    print(firstExecutable.name)
} else {
    fatalError("Failed to find proper executable name for package")
}
