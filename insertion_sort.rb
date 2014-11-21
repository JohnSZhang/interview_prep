def  insertionSort( ar)
  val_insert = ar[-1]
  curr_pos = ar.length - 1
  while curr_pos >= 0
    if curr_pos == 0
      ar[curr_pos] = val_insert
      puts ar.join(' ')
    elsif
      ar[curr_pos - 1] > val_insert
      ar[curr_pos] = ar[curr_pos - 1]
      puts ar.join(' ')
    else
      ar[curr_pos] = val_insert
      puts ar.join(' ')
      break
    end
    curr_pos -= 1
  end

end
count = gets.to_i
ar = gets.strip.split.map {|i| i.to_i}

insertionSort( ar )
