protocol CreateableDefault: Createable {
    init()
}

extension CreateableDefault {
    static func create() -> Any? {
        return Self()
    }
}
