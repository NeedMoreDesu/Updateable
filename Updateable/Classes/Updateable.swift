protocol Updateable {

}

extension Updateable {
    func update(block: (inout Self) -> ()) -> Self  {
        var item = self
        block(&item)
        return item
    }

    func map(block: (Self) -> Self?) -> Self? {
        return block(self)
    }
}
