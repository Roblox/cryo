--!strict
local omit = require(script.Parent.omit)

return function()
	local dictionary = { a = 1, b = 2, c = 3 }
	it("should remove 1 value", function()
		local result = omit(dictionary, "a")
		expect(result).toEqual({ b = 2, c = 3 })
	end)

	it("should remove 2 values", function()
		local result = omit(dictionary, "a", "b")
		expect(result).toEqual({ c = 3 })
	end)

	it("should work even if entry does not exist", function()
		local a = {
			foo = 1,
			bar = 2,
		}

		local result = omit(a, "baz")
		expect(result).toEqual({ foo = 1, bar = 2 })
	end)
end
