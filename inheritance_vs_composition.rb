class Person
  def name(name)
    @name = name
  end
end

class Parent < Person
  @name = 'James'

  def override()
    puts "PARENT override()"
  end

  def implicit()
    puts "PARENT implicit()"
  end

  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  @name = "rachel"

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()
p dad.name("james")
p son.name("jim")
p son
p dad
dad.implicit()
son.implicit()

p Child.ancestors()

dad.override()
son.override()

dad.altered()
son.altered()
