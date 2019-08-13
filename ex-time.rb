
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# bubble_sort time complexity => O(n^2)
# space complexity => O(3) => O(1)

def bubble_sort(arr)
    sorted = false
    while !sorted
        sorted = true
        (0...arr.length-1).each do |idx|        
            (idx+1...arr.length).each do |idx2|
                if arr[idx2] < arr[idx]
                    sorted = false
                    arr[idx],arr[idx2] = arr[idx2],arr[idx]
                end
            end
        end
    end
    arr.first
end

# find_min time complexity => O(n), n = number of inputs
# space complexity => => O(2) => O(1)

def find_min(arr)
    min = arr.first
    (1...arr.length).each do |idx|
        min = arr[idx] if arr[idx] < min
    end
    min
end

# time complexity => O(n^2)
# space complexity => O(n^3)

def largest_contiguous_subsum(arr)
  subsets = []

  (0...arr.length).each do |idx1|
    (idx1...arr.length).each do |idx2|
      subsets << arr[idx1..idx2]
    end
  end 

  largest_sum = subsets.first.sum

  subsets.each do |subset|
    if subset.sum > largest_sum
      largest_sum = subset.sum
    end
  end

  print subsets
end

  # list = [2, 3, -6, 7, -6, 7]
  # p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

  # O(3) => O(1)
  def better_largest_contiguous_subsum(arr)
    largest_sum = 0
    current_sum = 0
    i = 0
    while i < arr.length
      if arr[i] + current_sum >= 0
        current_sum += arr[i]
      else
        current_sum = 0
      end  
      largest_sum = current_sum if current_sum > largest_sum 
      i += 1
    end
    largest_sum
  end

  list = [2, 3, -6, 7, -6, 7]
  p better_largest_contiguous_subsum(list)

