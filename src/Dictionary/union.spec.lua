return function()
	local union = require(script.Parent.union)

	it("should combine two tables", function()
		local a = { hello = "world" }
		local b = { foo = "bar" }

		local result = union(a, b)

		expect(result).toEqual({
			hello = "world",
			foo = "bar",
		})
	end)

	it("should prefer values from the second table", function()
		local a = { hello = "world" }
		local b = { hello = "bar" }

		local result = union(a, b)

		expect(result).toEqual({
			hello = "bar",
		})
	end)

	it("should preseve old values if not in new table", function()
		local a = { hello = "world", foo = "bar" }
		local b = { hello = "bar" }

		local result = union(a, b)

		expect(result).toEqual({
			hello = "bar",
			foo = "bar",
		})
	end)
end
