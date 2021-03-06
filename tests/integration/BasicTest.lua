--  Tests:
--    info()
--    index()
--    get()
--    delete()
-- 

-- Importing modules
local util = require "lib.util"

-- Setting up environment
local _ENV = lunit.TEST_CASE "tests.integration.BasicTest"

function test()
  local dataset_1 = util.slice(dataset, 1, math.floor(#dataset/2))
  local dataset_2 = util.slice(dataset, math.floor(#dataset/2) + 1, #dataset)
  operations.info()
  operations.index(dataset_1)
  operations.getNonExistingDocuments(dataset_2)
  operations.getExistingDocuments(dataset_1)
  operations.index(dataset_2)
  operations.delete(dataset_1)
  operations.getNonExistingDocuments(dataset_1)
  operations.getExistingDocuments(dataset_2)
  operations.delete(dataset_2)
  operations.getNonExistingDocuments(dataset_2)
end
