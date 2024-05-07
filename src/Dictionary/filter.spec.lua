--!strict
local filter = require(script.Parent.filter)

return function()
	local dictionary: { [string]: number } = table.freeze({ a = 1, b = 2, c = 3, d = 4 })
	it("should filter even", function()
		local result = filter(dictionary, function(value)
			return value % 2 == 0
		end)

		expect(result).toEqual({ b = 2, d = 4 })
	end)

	it("should filter all", function()
		local result = filter(dictionary, function(_value)
			return false
		end)

		expect(result).toEqual({})
	end)

	it("should work with an empty table", function()
		local called = false

		local function callback()
			called = true
			return true
		end

		local a = filter({}, callback)

		expect(next(a)).never.to.be.ok()
		expect(called).to.equal(false)
	end)
end
