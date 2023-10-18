module P
end
class C
  include P
  def talk
    puts "Hi from original class!"
  end
end
module M
  def talk
    puts "Hello from module!"
  end
end

c = C.new
class << c
  include M
  prepend P
  p ancestors
end
