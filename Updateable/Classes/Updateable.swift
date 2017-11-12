protocol Updateable {

}

extension Updateable {
    public func update(block: (inout Self) -> ()) -> Self  {
        var item = self
        block(&item)
        return item
    }

    public func map(block: (Self) -> Self?) -> Self? {
        return block(self)
    }
}
