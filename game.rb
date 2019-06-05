ALL_UNITS = []

class Unit
  attr_accessor :name, :hp, :mp, :atk, :speed, :ct, :maxhp, :maxmp, :status
  def initialize(name)
    self.name = name
    self.hp = 50
    self.mp = 10
    self.atk = 10
    self.speed = 5
    self.ct = 0
    self.maxhp = 50
    self.maxmp = 10
    self.status = 'alive'
    ALL_UNITS << self
  end
   def attack(target)
     puts "#{self.name} attacked #{target.name}"
   end
 end

class Squire < Unit

  def initialize(name)
   super(name)
  end

  def throw_stone(target)
    puts "#{self.name} threw a stone..."
  end
end


class Wizard < Unit
  def initialize(name)
    super(name)
    self.hp -= 10
    self.speed -= 2
    self.mp += 30
  end
  def cast()
    puts "#{self.name} casted magic"
  end
end

class Knight < Unit
  def initialize(name)
    super(name)
    self.hp += 10
    self.atk += 5
    self.mp -= 5
  end
  def rend_armor()
    puts "#{self.name} rent armor! Everything is now rent!"
  end
end

def battle_is_over?
  dead_units = []
  ALL_UNITS.each do |each|
    if unit.status == 'alive'
      dead_units << false
    else
      dead_units << true
    end
  end
  if dead_units.count(false) > 1
    return false
end

def take_turn(u)
  puts "#{u.name}'s Turn! What will you do?"
  puts "1 - Attack\n2 - Special\n3 - Wait"
  choice = gets.chomp.to_i
  case choice
  when 1
    puts "#{u.name} Attacked"
    u.ct -= 25
  when 2
    puts "#{u.name} used a Special move!"
    u.ct -= 5
  when 3
    puts "Waiting..."
    u.ct -= 50
  else
    puts "INVALID SELECTION"
  end
end

def start_battle
  battle_time = true
  while battle_time
    if battle_is_over?
      break
    end
    ALL_UNITS.each do |unit|
      unit.ct+= unit.speed
      if unit.ct >= 100
      unit.ct = 100
      take_turn(unit)
      unit.ct = 0
      end
    end
  end
end

roy = Knight.new('Roy')
robin = Wizard.new('Robin')
marth = Squire.new('Marth')
