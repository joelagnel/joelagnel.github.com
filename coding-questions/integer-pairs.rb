#!/usr/bin/ruby
#
# Find all the pairs in a sequence
#
#

ar = [1, 3, 4, 2, 8, 5, -1, 6]

hash = []
neg_hash = []

sum = 5
ar.each do |e|
	if(e >= 0)
		hash[e] = true
	end
	if(e < 0)
		neg_hash[-e] = true
	end
end

for i in 0..(sum/2) do
	if(hash[i] && hash[sum-i])
		print "Pair (", i, ", ", sum-i, ")", "\n"
	end
end

for e in 0..(neg_hash.length-1) do
	if(neg_hash[e])
		if(hash[sum + e])
			print "Pair (", -e, ", ", sum + e, ")", "\n"
		end
	end
end

