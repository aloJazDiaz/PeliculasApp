struct PaisAPI: Decodable {
    let name: Name
    let flags: Flags
    let cca2: String?   // ← opcional

    struct Name: Decodable {
        let common: String
    }

    struct Flags: Decodable {
        let png: String
    }
}
