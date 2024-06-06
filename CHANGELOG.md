# Cryo Version History

## 1.1.0

- Added `Dictionary.filter`, `Dictionary.map`, `Dictionary.omit`, and `List.equals` ([#66](https://github.com/Roblox/cryo-internal/pull/66))
- Added `Dictionary.union` ([#71](https://github.com/Roblox/cryo-internal/pull/71))
  - Consumers migrating to Cryo looking for `set` should consider using this operation

## 1.0.3

- Partially roll back `Dictionary.join` optimization to preserve iteration behavior ([#58](https://github.com/Roblox/cryo-internal/pull/58))

## 1.0.2

- Optimized `Dictionary.join` performance using latest Luau best practices ([#56](https://github.com/Roblox/cryo-internal/pull/56))

## 1.0.1

- Exclude .spec test files from released package ([#49](https://github.com/Roblox/cryo-internal/pull/49))

## 1.0.0

- Added a List.findWhere utility that allows one to supply a predicate to search in a list.
- Added a List.toSet utility that creates a set of values from a list of values.

## Initial Release

- Basic functionality for Dictionary and List
