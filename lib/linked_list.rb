class Node
  attr_accessor :data, :next

  def initialize(val,next_node=nil)
    @data = val
    @next = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
    @size = 0
  end

  def add(value)
    # special case: if there aren't any nodes yet
    if @size == 0
      @head = Node.new(value)
      @size += 1
    else
      # Traverse to the end of the list
      # And insert a new node with the specified value
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = Node.new(value)
      @size += 1
    end
    self
  end

  def delete(val)
    return nil if @size == 0
    if @head.data == val
      # If the head is the element to be delete, the head needs to be updated
      @head = @head.next
      @size -= 1
    else
      # ... x -> y -> z
      # Suppose y is the value to be deleted, you need to reshape the above list to :
      #   ... x->z
      previous = @head
      current = @head.next
      while current != nil && current.data != val
        previous = current
        current = current.next
      end

      if current != nil
        previous.next = current.next
        @size -= 1
      end
    end
  end

  # Simmilar to the array_lists version of includ? but now we are working with nodes!!
  def include?(key)
    current = @head # beacuse we don't want to lose the head
    # traverse through all the noes until the end
    while current != nil # nil when no items are in the list
      # check if this noe's data is key
      if current.data == key
        # if it is then return true
        return true
      end
      # Need to move 'current' pointer to the next note
      current = current.next
      # end Traversing through the list
    end
    # return false because I didn't find key
    return false
  end

  def size
    return @size
    # current = @head
    # count = 0
    # while current != nil
    #   count += 1
    #   current = current.next
    # end
    # return count
  end

  def max
    # check if list is empty
    return nil if @size == 0
    # set max variable
    biggest = @head.data
    current = @head
    # traverse through the linked list until nil
    while current != nil
      if current.data > biggest
        biggest = current.data
      end
      current = current.next
    # check that node pointing to other node is greater than or less than the one its pointing to
    # save the larger variable
    # have the nodes check against max variable
    # save the value that is larges always... should only have to go through linked list once
    end
      return biggest
  end

  def to_s
    return "[]" if @head == nil
    # Traverse through the list till you hit the "nil" at the end
    current = @head
    full_list = []
    while current.next != nil
      full_list += [current.data.to_s]
      current = current.next
    end
    full_list += [current.data.to_s]
    return full_list.join("->")
  end
end

# implementation - how its build in the literal instance, Array and Linked Lists are different

# interface - an abstraction, the similarites between Array and Linked lists are the same

# the point is... you can have shared interfaces that have different implementations

# INTERVIEW QUESTIONS: Linked Lists is a very popular interview type question
