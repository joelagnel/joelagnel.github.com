#!/usr/bin/ruby
#
# Square root using binary search
#
#
#

$i = 0
def sqrt(n, beg, endd)
	# Check whether the ranges are out of bound - ignore this code if you can't understand
	if(beg * beg > n)
		beg = beg / 2
		return sqrt(n, beg, endd)
	elsif(endd * endd < n)
		endd = endd * 2
		return sqrt(n, beg, endd)
	end

	# Return when precision is met
	if (endd-beg < 0.0001)
		return endd
	end

	# Narrow down
	mid = (beg + endd) / 2.0
	print $i, " ", mid, "\n"
	$i = $i + 1
	if(mid == n / (mid * 1.0))		 # Do it this way to avoid overflow
		return mid;
	elsif(mid > n / (mid * 1.0))
		return sqrt(n, beg, mid)
	else
		return sqrt(n, mid, endd)
	end
end
	
n = 10
sqrt(n, 0, n / 2)

