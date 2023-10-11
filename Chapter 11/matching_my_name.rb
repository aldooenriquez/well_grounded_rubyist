name = "Aldo Enriquez zanahoria"
name_re = /(?<first>\w{4})\s+(?<last>\w{8})\s+(?<nickname>\w+)/
m = name.match(name_re)
puts "My name is #{m[:first]} #{m[:last]}, but you can call me #{m[:nickname]}"
