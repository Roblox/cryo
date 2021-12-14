<h1 align="center">Cryo</h1>
<div align="center">
	<a href="https://github.com/Roblox/cryo/actions/workflows/ci.yml">
		<img src="https://github.com/Roblox/cryo/actions/workflows/ci.yml/badge.svg" alt="GitHub CI" />
	</a>
	<a href='https://coveralls.io/github/Roblox/cryo?branch=main'>
		<img src='https://coveralls.io/repos/github/Roblox/cryo/badge.svg?branch=main&amp;t=49bK0s' alt='Coverage Status' />
	</a>
	<a href="https://roblox.github.io/cryo">
		<img src="https://img.shields.io/badge/docs-website-green.svg" alt="Documentation" />
	</a>
</div>

<div align="center">
	A collection of methods for working with immutable data in a functional way for Roblox Lua.
</div>

<div>&nbsp;</div>

Cryo is a library that helps you write more terse code that deals with immutable data. It includes traditional FP list primitives like `map`, `filter`, and `foldLeft`, as well as tools inspired by JavaScript like joining dictionaries.

Cryo works well to make [Rodux](https://github.com/Roblox/rodux) reducers cleaner!

## Installation

### Filesystem

- Add this repository as a Git submodule or copy it into your project
- Use a plugin like [Rojo](https://github.com/LPGhatguy/rojo) to sync the `src` folder into a place

### Model File

- Download the `rbxmx` model file attached to the latest release from the [GitHub releases page](https://github.com/Roblox/cryo/releases)
- Insert the model into Studio into a place like `ReplicatedStorage`

## Documentation

Documentation for Cryo is available on [the official documentation website](https://roblox.github.io/cryo).

## License

Licensed under the MIT license ([LICENSE.txt](LICENSE.txt) or http://opensource.org/licenses/MIT).

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the MIT license, shall be licensed as above, without any additional terms or conditions.

Take a look at the [contributing guide](CONTRIBUTING.md) for guidelines on how to contribute to Cryo.
