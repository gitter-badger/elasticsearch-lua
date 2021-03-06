-- Importing modules
local Stats = require "elasticsearch.endpoints.Cluster.Stats"
local MockTransport = require "lib.MockTransport"
local getmetatable = getmetatable

-- Setting up environment
local _ENV = lunit.TEST_CASE "tests.endpoints.ClusterTest.StatsTest"

-- Declaring local variables
local endpoint
local mockTransport = MockTransport:new()

-- Testing the constructor
function constructorTest()
  assert_function(Stats.new)
  local o = Stats:new()
  assert_not_nil(o)
  local mt = getmetatable(o)
  assert_table(mt)
  assert_equal(mt, mt.__index)
end

-- The setup function
function setup()
  endpoint = Stats:new{
    transport = mockTransport
  }
end

-- Testing request
function requestTest()
  mockTransport.method = "GET"
  mockTransport.uri = "/_cluster/stats"
  mockTransport.params = {}
  mockTransport.body = nil

  endpoint:setParams{}

  local _, err = endpoint:request()
  assert_nil(err)
end

-- Testing node request
function requestNodeTest()
  mockTransport.method = "GET"
  mockTransport.uri = "/_cluster/stats/nodes/n"
  mockTransport.params = {}
  mockTransport.body = nil

  endpoint:setParams{
    node_id = "n"
  }

  local _, err = endpoint:request()
  assert_nil(err)
end
