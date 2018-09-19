# all requires here
# Here's the questions I'm thinking about:
# - fibonacci (whatever version they want but preferably the recursive one)
# - array sorting (probably ask them generically how'd they do it and then see if they can get it faster)
# - find the smallest and largest number in an array (edited)
# - binary search for a number in a sorted array

def bin_search_array(num, array)
  return "not found!" if array.nil? || array.empty?
  mid = (array.length / 2).ceil
  puts mid
  if array[mid] == num
    puts "found!"
    return mid
  elsif array[mid] > num
    puts "searching left in #{array[0..mid]}"
    bin_search_array(num, array[0..mid])
  else
    puts "searching right in #{array[mid...array.length]}"
    bin_search_array(num, array[mid...array.length])
  end
end

def bin_search_array2(array, num, left, right)
  if right >= left
    mid = left + (((right - left) / 2).ceil)
    puts "looking at location #{mid}"
    if array[mid] == num
      return mid
    elsif num < array[mid] # search left
      puts "searching left on #{left} and #{mid}"
      bin_search_array2(array, num, left, mid)
    else #num > array[mid] => search right
      puts "searching right on #{mid+1} and #{right}"
      bin_search_array2(array, num, mid+1, right)
    end
  else
    return -1
  end
end

def fib(n)
  if n <= 1
    return n
  else
    return fib(n-2) + fib(n-1)
  end
end

def fib_seq(n)
  if n <= 1
    return n
  else
    prev = [0,1]
    for i in 2..n do
      nth = prev[0] + prev[1]
      prev[0] = prev[1]
      prev[1] = nth
    end
    prev[1]
  end
end

def bubble_sort(array)
  return array if array.length <= 1
  changed = true
  while changed
    changed = false
    for i in 0..(array.length-2) do
      puts "comparing location #{i} to location #{i+1}"
      if array[i] > array[i + 1]
        swap(array, i, i+1)
        changed = true
      end
    end
  end
  array
end

def quicksort(array, low, high)
  if low < high then
    p = partition(array, low, high)
    quicksort(array, low, p - 1)
    quicksort(array, p + 1, high)
  end
  array
end

def partition(array, low, high)
  pivot = array[high]
  i = low
  for j in low..(high-1) do
    if array[j] < pivot then
      swap(array, i, j)
      i += 1
    end
  end
  swap(array, i, high)
  return i
end

def swap(array, loc1, loc2)
  buf = array[loc2]
  array[loc2] = array[loc1]
  array[loc1] = buf
end

def permutate(perm, word)
  if word.empty?
    puts "#{perm}#{word}"
  else
    for i in 0...word.length do
      left = "#{perm}#{word[i]}"
      right = "#{word[0...i]}#{word[i+1]...word.length}"
      permutate(left, right)
    end
  end
end

def min_max(array)
  return if array.empty?
  min = array[0]
  max = array[0]
  for i in 0...array.length do
    min = array[i] if array[i] < min
    max = array[i] if array[i] > max
  end
  return min, max
end
