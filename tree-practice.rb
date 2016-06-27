class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_prefix(node)
  # base case
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

def operators(node)
  return if node == nil
  operators(node.left)
  if node.value == "+" || node.value == "-" || node.value == "*" || node.value == "/" || node.value == "%"
    print node.value + " "
  end
  operators(node.right)
end

def non_operators(node)
  return if node == nil
  non_operators(node.left)
  unless node.value == "+" || node.value == "-" || node.value == "*" || node.value == "/" || node.value == "%"
    print node.value + " "
  end
  non_operators(node.right)
end

def find_operator(node, operator)
  if node == nil
    return false
  elsif node.value == operator
    return true
  end
  find_operator(node.left, operator)
  find_operator(node.right, operator)
end

## see other test cases on paper

### trees we made in class ###
root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
# print_infix(root)

root2 = TreeNode.new("-")
root2.left = TreeNode.new("+")
root2.right = TreeNode.new("10")
root2.left.left = TreeNode.new("3")
root2.left.right = TreeNode.new("2")
# print_infix(root2)

puts ""

root3 = TreeNode.new("+")
root3.left = TreeNode.new("*")
root3.right = TreeNode.new("2")
root3.left.left = TreeNode.new("4")
root3.left.right = TreeNode.new("3")
# print_infix(root3)

# puts ""

root4 = TreeNode.new("-")
root4.left = TreeNode.new("+")
root4.right = TreeNode.new("%")
root4.left.left = TreeNode.new("*")
root4.left.right = TreeNode.new("2")
root4.left.left.left = TreeNode.new("4")
root4.left.left.right = TreeNode.new("3")
root4.right.left = TreeNode.new("10")
root4.right.right = TreeNode.new("5")
# print_infix(root4)

# puts ""

### testing out methods
#
# operators(root4)
# non_operators(root4)
puts find_operator(root4, "-")

# print_infix(root4)
# puts ""
# print_prefix(root4)
# puts ""
# print_postfix(root4)
