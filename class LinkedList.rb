class LinkedList
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def reverse_list(list, previous=nil)
  ''' reversing linklist using mutation'''
  if list
    next_node = list.next_node
    list.next_node = previous
    reverse_list(next_node, list)
  end
end
def print_linklist_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_linklist_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def infinite_loop?(list)
  ''' This method detects floyd Cycle Detection'''
  tortoise = list.next_node
  hare = list.next_node

  until hare.nil?
    hare = hare.next_node
    return false if hare.nil?

    hare = hare.next_node
    tortoise = tortoise.next_node
    return true if hare == tortoise
  end

  return false
end




node1 = LinkedList.new(40)
node2 = LinkedList.new(54, node1)
node3 = LinkedList.new(13, node2)
node4 = LinkedList.new(60, node3)
node5= LinkedList.new(23, node4)

print_linklist_values(node4)
puts "---------"
reverse_list(node4)
print_linklist_values(node1)

puts infinite_loop?(node5)
node1.next_node = node5 # creates an infinite loop
puts infinite_loop?(node5)