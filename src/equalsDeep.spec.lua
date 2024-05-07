local equalsDeep = require(script.Parent.equalsDeep)
return function()
	it("should return true for two identical tables", function()
		local a = { 1, 2, { 3, 4 } }
		local b = { 1, 2, { 3, 4 } }
		expect(equalsDeep(a, b)).to.equal(true)
	end)

	it("should return false for two different tables", function()
		local a = { 1, 2, { 3, 4 } }
		local b = { 1, 2, { 5, 6 } }
		expect(equalsDeep(a, b)).to.equal(false)
	end)

	it("should return true for two identical complex tables", function()
		local a = { 1, 2, { 3, 4, { 5, 6 } } }
		local b = { 1, 2, { 3, 4, { 5, 6 } } }
		expect(equalsDeep(a, b)).to.equal(true)
	end)

	it("should return false for two different complex tables", function()
		local a = { 1, 2, { 3, 4, { 5, 6 } } }
		local b = { 1, 2, { 3, 4, { 7, 8 } } }
		expect(equalsDeep(a, b)).to.equal(false)
	end)

	describe("with missing keys", function()
		local a = { a = 1, b = 2 }
		local b = { a = 1 }

		it(
			"should return false for two different dictionaries with missing keys with the longer table first",
			function()
				expect(equalsDeep(a, b)).to.equal(false)
			end
		)

		it(
			"should return false for two different dictionaries with missing keys with the longer table second",
			function()
				expect(equalsDeep(b, a)).to.equal(false)
			end
		)
	end)

	it("should return true for the same table reference", function()
		local x = {}
		expect(equalsDeep(x, x)).to.equal(true)
	end)
end
