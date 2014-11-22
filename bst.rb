class BinarySearch
  attr_reader :root

  def self.load(name)
    file = File.readlines(name)
    tree = BinarySearch.new
    file.each do |el|
      tree.insert(el.strip.to_i)
    end
    tree
  end

  def save(name)
    file = File.open(name, 'w')
    self.write(self.root, file)
    file.close
  end

  def write(node, file)
    file.puts(node.value.to_s)
    self.write(node.lchild, file) unless node.lchild.nil?
    self.write(node.rchild, file) unless node.rchild.nil?
  end

  def initialize(value = nil)
    @root = TreeNode.new(value)
  end

  def insert(value)
    @root.value.nil? ? @root = TreeNode.new(value) : @root.add_child(TreeNode.new(value))
  end

  def min(node = self.root)
    node.lchild.nil? ? node.value : self.min(node.lchild)
  end

  def max(node = self.root)
    node.rchild.nil? ? node.value : self.max(node.rchild)
  end

  def size(node = self.root)
    node.value ? curr = 1 : curr = 0
    lvalue = node.lchild.nil? ? 0 : self.size(node.lchild)
    rvalue = node.rchild.nil? ? 0 : self.size(node.rchild)
    curr + lvalue + rvalue
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
