## Constants

### Cryo.None
Represents a value that is intentionally present, but should be interpreted
as `nil`.

Cryo.None is used by included utilities to make removing values more
ergonomic.

---

## Dictionary
Defines utilities for working with 'dictionary-like' tables.

Dictionaries can be indexed by any value, but don't have the ordering
expectations that lists have.

### Dictionary.fold
```
Cryo.Dictionary.fold(dictionary, initialValue, callback) -> value
```
Iterates over the given dictionary and uses the callback to calculate the
returned value. The `callback` is expected to be a function like the following
that will be called for each pair of the dictionary. `currentValue` is the
last value returned by the `callback` function (or `initialValue` for the
first call) and `key, value` is a pair from the dictionary.

```
function(currentValue, key, value) -> value
```

The order in which the dictionary is traversed is not guaranteed.

### Dictionary.join
```
Cryo.Dictionary.join(...dictionaries) -> dictionary
```
Combine a number of dictionary-like tables into a new table.

Keys specified in later tables will overwrite keys in previous tables.

Use `Cryo.None` as a value to remove a value from the resulting table. This
is necessary because Lua does not distinguish between a value not being
present in a table and a value being `nil`.

### Dictionary.keys
```
Cryo.Dictionary.keys(dictionary) -> list
```
Combines all keys from the dictionary into a list-like table.

### Dictionary.values
```
Cryo.Dictionary.values(dictionary) -> list
```
Combines all values from the dictionary into a list-like table.

---

## List
Defines utilities for working with 'list-like' tables.

Lists are tables indexed with continuous integer keys starting at 1.

### List.filter
```
Cryo.List.filter(list, callback) -> list
```
Constructs a new list by filtering elements with the given callback.
`callback` is expected to be a function like the following, where `value`
is an element from the list and `index` is its position in the list.

```
callback(value, index) -> result
```

If `result` is truthy, the value will be included in the new list. Otherwise,
the value will be ignored.

### List.filterMap
```
Cryo.List.filterMap(list, callback) -> list
```
Combines the functionality of `List.filter` and `List.map`, where `callback`
should be a function like the following.

```
callback(value, index) -> result
```

`value` is an element from the list and `index` is its position in the list.
If `result` is `nil`, the value will not be included in the new list. Any other
result will add the `result` value to the new list.

### List.find
```
Cryo.List.find(list, value) -> index
```
Searches for the value in the given list and returns the position of the first
occurence of the value. If the value is not found, `find` will return `nil`.

### List.foldLeft
```
Cryo.List.foldLeft(list, initalValue, callback) -> value
```
Iterates over the given list and uses the callback to calculate the returned
value. The `callback` is expected to be a function like the following.

```
callback(currentValue, key, index) -> value
```

It will be called for each element of the list, from the beginning to the
end. `currentValue` is the last value returned by the `callback` function
(or `initialValue` for the first call) and `element, index` is a pair from
the dictionary.

### List.foldRight
```
Cryo.List.foldRight(list, inital, callback) -> value
```
Similar to [`List.foldLeft`](#list-foldLeft), except that the callback is
called for each element of the list from the end to the beginning.

### List.getRange
```
Cryo.List.getRange(list, startIndex, endIndex) -> list
```
Constructs a list from the given range. Both elements at `startIndex` and
`endIndex` will be included in the returned list.

### List.join
```
Cryo.List.join(...lists) -> list
```
Combines all the given lists into a single new list.

### List.map
```
Cryo.List.map(list, callback) -> list
```
Constructs a new list by using the callback to replace elements in the list.
`callback` should be a function like the following.

```
callback(element, index) -> newElement
```

`element` is an element from the list and `index` is its position. The
returned value is the new element in the new list at the same position.

### List.removeIndex
```
Cryo.List.removeIndex(list, index) -> list
```
Creates a new list without the given index.

### List.removeRange
```
Cryo.List.removeRange(list, startIndex, endIndex) -> list
```
Creates a new list without the given range. The indexes `startIndex` and
`endIndex` will not be included in the returned list.

### List.removeValue
```
Cryo.List.removeValue(list, value) -> list
```
Creates a new list without any occurences of the given value.

### List.reverse
```
Cryo.List.reverse(list) -> list
```
Creates a new list with the same elements from the given list, but in the
opposite order.
