public protocol Createable: Updateable {
    static func create() -> Any?
}

extension Createable {
    public static func create(block: (inout Self) -> ()) -> Self? {
        return (self.create() as? Self)?.update(block: block)
    }
}
