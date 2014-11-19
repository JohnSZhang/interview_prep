class binary_search
  attr_reader :root

  def initialize(value = nil)
    value.nil? @root = new tree_node(nil)
  end

  def insert(value)
    @root.value.nil? ? @root = new tree_node(value) : @root.add_child( new tree_node(value))
  end

end

class tree_node
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
