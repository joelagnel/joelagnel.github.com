require 'pp'

#!/usr/bin/ruby

num = [1, 2, 4, 5, 6]

def find_all(sum, arr, total_sum, list)
	elem = arr[0]
	list.push(elem)
	pp list
	if(arr.size > 1)
		for i in (1..(arr.length-1)) do
			find_all(0, arr[i..-1], 0, list)
		end
	end
	list.pop
end

for i in (0..(num.length-1)) do
	find_all(0, num[i..-1], 0, [])
end
