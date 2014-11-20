class BinarySearch
  attr_reader :root

  def initialize(value = nil)
    @root = TreeNode.new(value)
  end

  def insert(value)
    @root.value.nil? ? @root = TreeNode.new(value) : @root.add_child(TreeNode.new(value))
  end

end

class TreeNode
  attr_accessor :parent, :lchild, :rchild, :value

  def initialize(value)
    @value = value
  end

  def parent(parent_node, dir)
      @parent = parent
  end

  def add_child(new_node)
    if new_node.value < @value
      if self.lchild.nil?
        new_node.parent = self
        self.lchild = new_node
      else
        @lchild.add_child(new_node)
      end
    elsif new_node.value > @value
      if self.rchild.nil?
          new_node.parent = self
          self.rchild = new_node
      else
        @rchild.add_child(new_node)
      end
    else
      put "already added"
    end
  end
end
