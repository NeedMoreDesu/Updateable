# Updateable

[![Version](https://img.shields.io/cocoapods/v/Updateable.svg?style=flat)](http://cocoapods.org/pods/Updateable)
[![License](https://img.shields.io/cocoapods/l/Updateable.svg?style=flat)](http://cocoapods.org/pods/Updateable)
[![Platform](https://img.shields.io/cocoapods/p/Updateable.svg?style=flat)](http://cocoapods.org/pods/Updateable)

## Example

Example of turning structs into Createable & Updateable

``` swift
struct SomeStruct: CreateableDefault {
    var someInt = 12
    var someString = "asdf"
}

let a = SomeStruct.create {
    $0.someString = "abcd"
}!

a.someInt // 12
a.someString // "abcd"

let b = a.update {
    $0.someInt = 41
}

a.someInt // 12
a.someString // "abcd"
b.someInt // 41
b.someString // "abcd"

let c = b.map { old in
    if old.someInt % 2 == 1 { // is odd
        return SomeStruct.create { new in
            new.someInt = old.someInt + 1
            new.someString = "efg"
        }
    }
    return nil
}

c?.someInt // 42
c?.someString // "efg"
```

Example of defining how to create UIViewController out from storyboard:

``` swift
class SomeVC: UIViewController, Createable {
    var someInputParam: SomeStruct!
    static func create() -> Any? {
        let storyboard = UIStoryboard(name: "SomeStoryboard", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "SomeVC")
    }
}

SomeVC.create {
    $0.someInputParam = SomeStruct.create {
        $0.someInt = 9000
        $0.someString = "You get the idea"
    }
}
```

Using native struct initializer instead of Createable

``` swift
struct SomeStruct: Updateable {
    var someInt: Int
    var someString: String
}

let a = SomeStruct(someInt: 100, someString: "No .init() involved")

a.someInt // 100
a.someString // "No .init() involved"

let b = a.update {
    $0.someString = "Yeah."
}

b.someInt // 100
b.someString // "Yeah"

let c = a.map { (old) -> SomeStruct? in
    return SomeStruct(someInt: 9000, someString: "No jokes")
}!

c.someInt // 9000
c.someString // "No jokes"
```

## Installation

Updateable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Updateable'
```

## Author

Oleksii Horishnii, oleksii.horishnii@gmail.com

Inspired by https://gist.github.com/PaulTaykalo/43ff20e3313644c5b3ab7390221e8e7a by [Pavel Taykalo](https://github.com/PaulTaykalo), tt.kilew@gmail.com

## License

Updateable is available under the MIT license. See the LICENSE file for more info.
