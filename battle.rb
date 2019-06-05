class Warrior
  attr_accessor :name, :hp, :mp, :atk, :magic, :status
  def initialize(name)
    @name = name
    self.hp = 100
    self.mp = 10
    self.atk = 30
    self.magic = 5
    self.status = 'alive'
  end

  def attack(target)
    target.hp -= self.atk
    puts `#{@name} attacked #{target.name}`
    if target.hp < 1
      target.status = 'fallen'
      puts `#{target.name} has fallen!`
    end
  end
end

class Mage
  attr_accessor :name, :hp, :mp, :atk, :magic, :status
  def initialize(name)
    @name = name
    self.hp = 60
    self.mp = 100
    self.atk = 10
    self.magic = 40
    self.status = 'alive'
  end

  def cast_spell(target)
    target.hp -= self.magic
    puts `#{@name} casted Firaga on #{target.name}`
    if target.hp < 1
      target.status = 'fallen'
      puts `#{target.name} has burned!`
    end
  end
end

class Rogue
  attr_accessor :name, :hp, :mp, :atk, :magic, :status
  def initialize(name)
    @name = name
    self.hp = 85
    self.mp = 40
    self.atk = 20
    self.magic = 15
    self.status = 'alive'
  end

  def stab(target)
    target.hp -= self.atk
    if target.status = 'bleed'
      puts "#{target.name} is bleeding"
      target.hp -= 5
    end
    target.status = 'bleed'
    puts "#{@name} stabbed #{target.name}"
    if target.hp < 1
      target.status = 'fallen'
      puts `#{target.name} bled out!`
    end
  end
end

def take_turn(player, t)
  if player.class == Warrior
    puts "Select an Action\n1 - Attack\n2 - Pass\n3 - Quit"
    answer = gets.chomp.to_i
    if answer == 1
      puts "#{player.name} attacked"
      player.attack(t)
    elsif answer == 2
      puts 'Skipping Turn...'
    elsif answer == 3
      puts 'Existing Game'
      battle_time = false
    else
      puts 'Invalid Input'
    end
  elsif player.class == Mage
    puts 'Select and Action\n1 - Cast Spell\n2 - Pass\n3 - Quit'
    if answer == 1
      puts '#{player.name} attacked'
      player.cast_spell(t)
    elsif answer == 2
      puts 'Skipping Turn...'
    elsif answer == 3
      puts 'Existing Game'
      battle_time = false
    else
      puts 'Invalid Input'
    end
  elsif player.class == Rogue
    puts 'Select and Action\n1 - Stab\n2 - Pass\n3 - Quit'
    if answer == 1
      puts '#{player.name} attacked'
      player.stab(t)
    elsif answer == 2
      puts 'Skipping Turn...'
    elsif answer == 3
      puts 'Existing Game'
      battle_time = false
    else
      puts 'Invalid Input'
    end
  end
end

def start_battle(p1,p2)
  puts "Battle Begins!"
  $battle_time = true
  turn_count = 0
  while $battle_time # truthy
    if p1.status == 'fallen' || p2.status == 'fallen'
      puts 'The battle is over'
      break
    end
    turn_count +=1
    if turn_count % 2 == 0
      take_turn(p1, p2)
    else
      take_turn(p2, p1)
    end
  end
end
