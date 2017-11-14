public protocol CreateableDefault: Createable {
    init()
}

extension CreateableDefault {
    public static func create() -> Any? {
        return Self()
    }
}
