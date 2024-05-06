return function()
	local isEmpty = require(script.Parent.isEmpty)

	it("should return true on an empty table", function()
		expect(isEmpty({})).to.equal(true)
	end)

	it("should return false with a list of values", function()
		expect(isEmpty({ 1, 2, 3 })).to.equal(false)
	end)

	it("should return false with a dictionary of keys and values", function()
		expect(isEmpty({ key = "value" })).to.equal(false)
	end)
end
