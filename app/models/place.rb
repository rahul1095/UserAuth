class Place < ApplicationRecord
	has_one :node
	attr_accessor :nodename
end
