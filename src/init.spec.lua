local equalsDeep = require(script.Parent.equalsDeep)

local function toString(t)
	if type(t) == "table" then
		local fields = {}
		for i, v in pairs(t) do
			local field = if type(i) == "number" then toString(v) else toString(i) .. "=" .. toString(v)
			table.insert(fields, field)
		end
		return "{" .. table.concat(fields, ", ") .. "}"
	else
		return tostring(t)
	end
end

return function()
	beforeAll(function()
		expect.extend({
			toEqual = function(a, b)
				if a == b then
					return {
						pass = true,
						message = "Expected to not equal",
					}
				end

				if equalsDeep(a, b) then
					return {
						pass = true,
						message = "Expected to not equal",
					}
				else
					return {
						pass = false,
						message = string.format(
							"Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n",
							toString(a),
							toString(b)
						),
					}
				end
			end,

			toBe = function(a, b)
				return {
					pass = a == b,
					message = string.format(
						"Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n",
						toString(a),
						toString(b)
					),
				}
			end,
		})
	end)

	it("should load", function()
		require(script.Parent)
	end)
end
