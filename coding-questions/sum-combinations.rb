#!/usr/bin/ruby

require 'pp'

num = [1, 2, 4, 5, 6]

def find_all(sum, arr, total_sum, list)
	elem = arr[0]
	if(elem + total_sum > sum)
		return
	end
	list.push(elem)
	if(elem + total_sum == sum)
		pp list	# output the list, we're done with this recursion
		return
	else
		if(arr.size > 1)
			for i in (1..(arr.length-1)) do
				# arr[i..-1] is the array excluding the first i elements
				find_all(sum, arr[i..-1], elem + total_sum, list) 
			end
		end
	end
	list.pop
end

sum = 6
for i in (0..(num.length-1)) do
	find_all(sum, num[i..-1], 0, [])
end

