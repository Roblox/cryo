## Constants

### None

Represents a value that is intentionally present, but should be interpreted as `nil`.

`Cryo.None` is used by included utilities to make removing values more ergonomic.

---

## isEmpty

```
Cryo.isEmpty(table) -> bool
```

Tells whether the given table is empty in constant time. Works on both dictionary-like and list-like tables.

---

## Dictionary

Defines utilities for working with dictionary-like tables.

Dictionaries can be indexed by any value, but don't have the ordering expectations that lists have.

### Dictionary.equals

```
Cryo.Dictionary.equals(...dictionaries) -> boolean
```

Compares two or more dictionaries shallowly for value equality. Returns `true` if all dictionaries have the same keys and values, `false` otherwise.

---

### Dictionary.filter

```
Cryo.Dictionary.filter(dictionary, predicate) -> dictionary
```

Constructs a new dictionary by filtering elements with the given predicate. The predicate should be a function that accepts the values and keys of the dictionary and which returns a boolean.

```lua
local function isValueEven(value)
	return value % 2 == 0
end

local dictionary = {
	a = 1,
	a = 2,
	c = 3
}

local evenValues = Dictionary.filter(dictionary, isValueEven)
```

```lua
local function isKeyUpper(_value, key)
	return string.upper(key) == key
end

local dictionary = {
	a = 1,
	B = 2,
	c = 3
}

local upperKeys = Dictionary.filter(dictionary, isKeyUpper)
```

---

### Dictionary.join

```
Cryo.Dictionary.join(...dictionaries) -> dictionary
```

Combine a number of dictionary-like tables into a new table.

Keys specified in later tables will overwrite keys in previous tables.

Use `Cryo.None` as a value to remove a value from the resulting table. This is necessary because Lua does not distinguish between a value not being present in a table and a value being `nil`.

`Dictionary.join` is handy when dealing with configuration tables, where we might want default values.

```lua
local defaultConfig = {
	frobulateProngs = true,
	frobulator = "less"
}

local function doSomething(userConfig)
	local config = Dictionary.join(defaultConfig, userConfig)

	if config.frobulateProngs then
		useFrobulator(config.frobulator)
	end
end
```

---

### Dictionary.keys

```
Cryo.Dictionary.keys(dictionary) -> list
```

Combines all keys from the dictionary into a list-like table.

---

### Dictionary.map

```
Cryo.Dictionary.map(dictionary, callback) -> dictionary
```

Constructs a new dictionary by using the callback to replace elements in the dictionary. `callback` should be a function like the following.

```
callback(value, key) -> newValue, newKey?
```

If `newKey` is not provided, the original key will be used.

---

### Dictionary.omit

```
Cryo.Dictionary.omit(dictionary, ...keys) -> dictionary
```

Creates a new dictionary without the given keys.

---

### Dictionary.union

```
Cryo.Dictionary.union(dictionaryA, dictionaryB) -> dictionary
```

Creates a new dictionary that contains all the keys and values from both dictionaries. If a key is present in both dictionaries, the value from `dictionaryB` will be used.

---

### Dictionary.values

```
Cryo.Dictionary.values(dictionary) -> list
```

Combines all values from the dictionary into a list-like table.

---

## List

Defines utilities for working with 'list-like' tables.

Lists are tables indexed with continuous integer keys starting at 1.

### List.equals

```
Cryo.List.equals(...lists) -> boolean
```

Compares two or more lists shallowly for value equality. Returns `true` if all lists have the same values in the same order, `false` otherwise.

---

### List.filter

```
Cryo.List.filter(list, callback) -> list
```

Constructs a new list by filtering elements with the given callback.

`callback` is expected to be a function with this signature:

```
callback(value, index) -> result
```

If `result` is truthy, the value will be included in the new list. Otherwise, the value will be ignored.

---

### List.filterMap

```
Cryo.List.filterMap(list, callback) -> list
```

Combines the functionality of `List.filter` and `List.map`.

`callback` should be a function with this signature:

```
callback(value, index) -> result
```

If `result` is `nil`, the value will not be included in the new list. Any other result will add the `result` value to the new list.

---

### List.find

```
Cryo.List.find(list, value) -> index | nil
```

Searches for the value in the given list and returns the position of the first occurence of the value. If the value is not found, `find` will return `nil`.

---

### List.findWhere

```
Cryo.List.findWhere(list, predicate) -> index | nil
```

`predicate` should be a function with this signature:

```
predicate(value, index) -> result
```

Searches for the first index in the given list for which `predicate` returns a truthy value. If the predicate never returns a truthy value, `findWhere` will return `nil`.

---

### List.foldLeft

```
Cryo.List.foldLeft(list, callback, initialValue) -> value
```

Iterates over the given list and uses the given callback to calculate the returned value.

`callback` should be a function with this signature:

```
callback(accumulator, value, index) -> newAccumulator
```

`callback` will be invoked once for each value in the list. It should return a new accumulator value that will be passed to the next invocation of `callback`.

`foldLeft` is sometimes known as `reduce`. It can be used to perform operations like summing a list:

```lua
local list = {1, 2, 3}
local function add(a, b)
	return a + b
end

local sum = List.foldLeft(list, add, 0)
```

---

### List.foldRight

```
Cryo.List.foldRight(list, callback, initialValue) -> value
```

Similar to [`List.foldLeft`](#list-foldLeft), except the list is traversed from right-to-left instead of from left-to-right. `foldRight` is useful when working with operations that aren't associative.

---

### List.join

```
Cryo.List.join(...lists) -> list
```

Combines all the given lists into a single new list.

---

### List.map

```
Cryo.List.map(list, callback) -> list
```

Constructs a new list by using the callback to replace elements in the list. `callback` should be a function like the following.

```
callback(element, index) -> newElement
```

---

### List.removeIndex

```
Cryo.List.removeIndex(list, index) -> list
```

Creates a new list without the given index.

### List.removeRange

```
Cryo.List.removeRange(list, startIndex, endIndex) -> list
```

Creates a new list without the given range. The indexes `startIndex` and `endIndex` will not be included in the returned list.

---

### List.removeValue

```
Cryo.List.removeValue(list, value) -> list
```

Creates a new list without any occurences of the given value.

---

### List.replaceIndex

```
Cryo.List.replaceIndex(list, index, value) -> list
```

Creates a new list with the new value at the given index. The function will throw an error if the index is larger than the list length.

---

### List.reverse

```
Cryo.List.reverse(list) -> list
```

Creates a new list with the same elements from the given list, but in the opposite order.

---

### List.sort

```
Cryo.List.sort(list[, callback]) -> list
```

Constructs a new list that consists of the elements of the input list, but sorted using the given callback.

`List.sort` is the immutable equivalent of Lua's `table.sort`.

### List.toSet

```
Cryo.List.toSet(list) -> dictionary
```

Creates a dictionary where each value in the given list corresponds to a key in the dictionary with a value of true.
