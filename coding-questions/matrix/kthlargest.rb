#!/usr/bin/ruby
#
# Given a N*N Matrix. 
#	All rows are sorted, and all columns are sorted.
#	Find the Kth Largest element of the matrix.

m = [ [1,6,9 ],
	  [3,7,10],
	  [5,8,11] ]

n = m.length

k = 1
large = 0

# Find the size of the sub matrix that we are going to be using
# to find the kth largest element. so for k = 5, we need to look
# at a matrix of size 2 x 2. This matrix is the above 'm' excluding
# the first row and first column
sub_n = Math.sqrt(k).ceil

# Convert the size of the sub matrix into a starting index into
# the original matrix m
start = n - sub_n

# We are going to be looking at only the first row and first column
# of the sub matrix as all other elements in the sub matrix are larger
# or equal to the elements of the first row and column of the sub matrix
# So reduce k by this amount
k = k - ((sub_n - 1) * (sub_n - 1))

def find_kth_largest(a1, a2, len, k)
	cur_large = 0
	a1_index = len - 1
	a2_index = len - 1
	while k != 0 do
		if a1[a1_index] > a2[a2_index]
			large = a1[a1_index]
			a1_index -= 1
		else
			large = a2[a2_index]
			a2_index -= 1
		end
		k -= 1
		if k == 0
			return large
		end
	end
end

# Extract the first row and first column of the sub matrix, and look for the k th
# largest element. The function above just uses the same algorithm a merging procedure
# in the merge sort uses. We start from the end, maintain 2 points to the current location
# from the end of the row and column extracts and continuously go k times down either the
# row or the column till k is 0. Once k is 0, we know that we have the current element
# we went down as the kth largest element.
puts find_kth_largest(m[start][start..(n-1)], m[start..(n-1)].map{ |a| a[start] }, sub_n, k)

