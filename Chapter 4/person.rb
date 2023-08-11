class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends
  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end

  def Person.method_missing(m, *args)
    method = m.to_s
    if method.start_with?("all_with_")
      attr = method[9..-1]
      if Person.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else
        raise ArgumentError, "Can't find #{attr}"
      end
    else
      super
    end
  end
  def has_friend(friend)
    @friends << friend
  end
  def has_hobby(hobby)
    @hobbies << hobby
  end
end

j = Person.new("Jhon")
p = Person.new("Paul")
g = Person.new("George")
r = Person.new("Ringo")
e = Person.new("Eric B.")
r = Person.new("Rakim")
e.has_friend(r)
j.has_friend(p)
j.has_friend(g)
g.has_friend(p)
r.has_hobby("rings")
e.has_hobby("cycling")
r.has_hobby("drums")
Person.all_with_friends(p).each do |person|
  puts "#{person.name} is friend with #{p.name}."
end
Person.all_with_hobbies("rings").each do |person|
  puts "#{person.name} is into rings."
end
Person.all_with_hobbies("cycling").each do |person|
  puts "#{person.name} is into cycling."
end
Person.all_with_hobbies("rings").each do |person|
  puts "#{person.name} is into drums."
end
