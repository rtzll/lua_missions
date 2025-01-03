--[[
  EXERCISE: Monkey-patching strings

  With all you have learnt now, you should be able to do this exercise

  Add the necessary code below so that the test at the end passes

]]

-- INSERT YOUR CODE HERE

local st = getmetatable("").__index

function st:starts_with(str)
  return string.sub(self, 1, #str) == str
end

function st:ends_with(str)
  if #str > #self then return false end
  return string.sub(self, -#str) == str
end

-- END OF CODE INSERT

function test_starts_with()
  local str = "Lua is awesome"

  assert_true(str:starts_with("L"))
  assert_true(str:starts_with("Lua"))
  assert_true(str:starts_with("Lua is"))
  assert_not(str:starts_with("awe"))
end

function test_ends_with()
  local str = "Lua is awesome"

  assert_true(str:ends_with("e"))
  assert_true(str:ends_with("some"))
  assert_true(str:ends_with("awesome"))
  assert_not(str:ends_with("awe"))
end

-- hint: string == getmetatable("").__index
