--!strict
local map = require(script.Parent.map)

return function()
	local dictionary: { [string]: number } = { a = 1, b = 2, c = 3 }
	it("should map the value", function()
		local result = map(dictionary, function(value, key)
			return value * 10, key
		end)
		expect(result).toEqual({ a = 10, b = 20, c = 30 })
	end)

	it("should change output dict type", function()
		local result = map(dictionary, function(value, key)
			return tostring(value), key
		end)
		expect(result).toEqual({ a = "1", b = "2", c = "3" })
	end)

	it("should filter with nil", function()
		local result = map(dictionary, function(value, key)
			return if value == 2 then nil else value, key
		end)
		expect(result).toEqual({ a = 1, c = 3 })
	end)

	it("should convert list to dictionary", function()
		local list = { "a", "b", "c" }
		local result = map(list, function(_value)
			return 0, "a"
		end)
		expect(result).toEqual({ a = 0 })
	end)

	it("should set the new values to the first result of the given callback", function()
		local a: { [string]: number } = {
			foo = 1,
			bar = 2,
			baz = 3,
		}

		local function double(v: number)
			return v * 2
		end

		local b = map(a, double)

		for k, v in pairs(b) do
			expect(double(a[k])).to.equal(v)
		end
	end)
end
