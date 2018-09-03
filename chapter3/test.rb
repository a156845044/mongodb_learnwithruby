# = 第一种实现
#But what if you want to be able to view or change the name? Ruby provides an easy way of providing access to an object’s variables.
class Greeter
  def initialize(name = "World")
    @name = name
  end

  def say_hi(name = "big!")
    puts "Hi #{@name}"
  end

  def say_bye
    puts "Bye #{@name},come back soon."
  end

  attr_accessor :name
end

#修改方法
class Greeter
  #Using attr_accessor defined two new methods for us, name to get the value, and name= to set it.
  # = 第二种实现
  attr_accessor :name
end

#greeter = Greeter.new("page")
#greeter.say_hi
#greeter.say_bye

class MegeGreeter
  attr_accessor :names

  # Create the Object
  def initialize(names = "World")
    @names = names
  end

  #   对所有人打招呼
  def say_hi
    if @names.nil?
      puts "... "
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      # @names 是一个泛型集合
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@name}!"
    end
  end

  # 和所有人说再见
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      #  Join the list elements with commas
      #  用逗号将列表中的元素进行拼接
      puts "Goodbye #{@names.join(", ")}. come back soon !"
    else
      puts "Goodbye #{@names}. Come back soon !"
    end
  end
end

#__FILE__ 是一个魔法值，它存有现在运行的脚本文件的名字。$0 是启动脚本的名字。
#代码里的比较结构的意思是 “如果这是启动脚本的话…” 这允许代码作为库调用的时候不运行启动代码，
#而在作为执行脚本的时候调用启动代码。
if __FILE__ == $0
  mg = MegeGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  # 更改姓名为 "Zeke"
  mg.names = "Zeke"

  mg.say_hi
  mg.say_bye

  # 将名称更改 数组形式
  mg.names = ["dfq", "Dave", "Charles"]

  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
