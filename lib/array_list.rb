# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList
  def initialize
    # we are pretending that @storage is a NATIVE ARRY in this situation
    @storage = [0,0,0,0,0,0,0,0,0,0] # native array: fixed size, indexing only

    # size is 0 with all the zeros in it, fixed capacity is 10
    @size = 0 #manual tracking of how many things are actually in the array
  end

  # Adds _value_ at the end of the list
  def add(value)
    raise "bad things" if @size == @storage.length
    @storage[@size] = value
    @size += 1
  end

  # Deletes the _last_ value in the array
  def delete
    raise "bad things" if @size == 0
    # @storage[@size] = 0
    @size -= 1
  end

  def include?(key)
    @size.times do |i|
      return true if @storage[i] == key
    end
    return false
  end

  # returns number of elements we care about
  def size
    return @size
    # count = 0
    # @size.times do
    #   count += 1
    # end
    # return count
  end

  # returns the largest element
  def max
    # My first thought
    # find_max = -1
    # @size.times do |i|
    #   if find_max < i
    #     find_max = i
    #   end
    # end
    raise "bad things" if @size == 0
    biggest = @storage[0]
    @size.times do |i|
      if @storage[i] > biggest
        biggest = @storage[i]
      end
    end
  end

  def to_s # in java.. this is written toString
    str = ""
    @size.times do |i|
      str += "#{@storage[i]}, "
    end
    return "[#{str[0..-3]}]"
  end
end
