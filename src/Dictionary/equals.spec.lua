local equals = require(script.Parent.equals)

return function()
	it("should return whether provided objects have reference equality", function()
		local a = {
			foo = 1,
			bar = 2,
			baz = 3,
			qux = {},
		}
		local b = {
			foo = 1,
			bar = 2,
			baz = 3,
			qux = a.qux,
		}
		local c = {
			foo = 1,
			bar = 2,
			baz = 3,
			qux = {},
		}

		expect(equals(a, b)).to.equal(true)
		expect(equals(a, c)).to.equal(false)
	end)

	it("should work with an arbitrary number of objects", function()
		local a = {
			foo = 1,
			bar = 2,
			baz = 3,
		}
		local b = a
		local c = {
			foo = 1,
			bar = 2,
			baz = 3,
		}
		local d = {
			oof = 4,
			rab = 5,
			zab = 6,
		}
		local e = d
		local f = {
			oof = 4,
			rab = 5,
			zab = 6,
		}

		expect(equals(a, b, c)).to.equal(true)
		expect(equals(a, b, c, d, e, f)).to.equal(false)
	end)

	it("should work with one object", function()
		local a = {}

		expect(equals(a)).to.equal(true)
	end)

	it("should work with zero objects", function()
		expect(equals()).to.equal(true)
	end)

	it("should work with nil entry", function()
		local a = {}
		expect(equals(nil :: any, a)).to.equal(false)
	end)

	it("should return false if the second dict has an extra key", function()
		local a = { hello = "world" }
		local b = { hello = "world", foo = "bar" }

		expect(equals(a, b)).to.equal(false)
	end)
end
