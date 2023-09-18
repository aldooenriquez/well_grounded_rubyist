class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end

  def my_map
    acc = []
    my_each { |e| acc << yield(e) }
    acc
  end
end

class Integer
  def my_times
    (0...self).to_a.my_each {|e| yield(e)}
  end
end


5.my_times { |i| puts "I'm on iteration #{i}!" }
