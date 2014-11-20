def utopian_tree
    cases = Integer(gets)
    throw "not within cycle bound" unless cases > 0 && cases <= 10
    cycles = []
    cases.times do |i|
      cycles << Integer(gets)
    end

    cycles.length.times do |j|
        puts grow_tree(cycles.shift)
    end
end

def grow_tree(cycle)
    throw "not within cycle bound" unless cycle >= 0 && cycle <= 60
    height = 1
    curr_count = 0
    while curr_count < cycle
        curr_count += 1
        curr_count % 2 == 1 ? height = height * 2 : height += 1
    end
    height
end

utopian_tree
