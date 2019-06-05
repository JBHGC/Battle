$ALL_FIGHTERS = []

class Warrior
  attr_accessor :name, :hp, :mp, :atk, :magic, :spd, :status, :ct, :equipment
  def initialize(name)
    @name = name
    self.hp = 100
    self.mp = 10
    self.atk = 30
    self.magic = 5
    self.spd = 7
    self.status = 'alive'
    self.ct = 0
    self.equipment = []
    $ALL_FIGHTERS << self
  end

  def attack(target)
    target.hp -= self.atk
    puts `#{@name} attacked #{target.name}`
    if target.hp < 1
      target.status = 'fallen'
      $ALL_FIGHTERS.delete(target)
      puts `#{target.name} has fallen!`
  end
  end
end

class Mage
  attr_accessor :name, :hp, :mp, :atk, :magic, :spd, :status, :ct, :equipment
  def initialize(name)
    @name = name
    self.hp = 60
    self.mp = 100
    self.atk = 10
    self.magic = 40
    self.spd = 5
    self.status = 'alive'
    self.ct =
    self.equipment = []
    $ALL_FIGHTERS << self
  end

  def cast_spell(target)
    target.hp -= self.magic
    puts `#{@name} casted Firaga on #{target.name}`
    if target.hp < 1
      target.status = 'fallen'
      $ALL_FIGHTERS.delete(target)
      puts `#{target.name} has burned!`
    end
  end
end

class Rogue
  attr_accessor :name, :hp, :mp, :atk, :magic, :spd, :status, :ct, :equipment
  def initialize(name)
    @name = name
    self.hp = 85
    self.mp = 35
    self.atk = 20
    self.magic = 15
    self.spd = 9
    self.status = 'alive'
    self.ct = 0
    self.equipment = []
    $ALL_FIGHTERS << self
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
      $ALL_FIGHTERS.delete(target)
      puts `#{target.name} bled out!`
    end
  end
end

class Equipment
  attr_accessor :type, :name, :hp, :mp, :atk, :magic, :spd
  def initialize(name, type, hp, mp, atk, magic, spd)
    @name = name
    self.type
    self.hp
    self.mp
    self.atk
    self.magic
    self.spd
  end
end

def mkEquipment(player, type, name)
  if type.downcase == 'armor'
    armor = Equipment.new("#{name}", "armor", 13, 0, 0, 0, 0)
    player.equipment << armor
    puts "#{player.name} Equipped #{armor.name}"
    puts "#{player.name}'s Equipment: #{player.equipment[0].name}"
  elsif type.downcase == 'boots'
    boots = Equipment.new("#{name}", "boots", 7, 0, 0, 0, 0)
    player.equipment << boots
    puts "#{player.name} Equiped #{boots.name}"
  elsif type.downcase == 'sword'
    sword = Equipment.new("#{name}", "sword", 0, 0, 7, 0, 0)
    player.equipment << sword
    puts "#{player.name} Equiped #{boots.name}"
  end
end

def take_turn(player)
  if player.class == Warrior
    puts "#{player.name}'s Turn! Select an Action\n1 - Attack\n2 - Pass\n3 - Quit\n\n"
    answer = gets.chomp.to_i
    if answer == 1
      puts "Who will you attack?"
      target = gets.chomp.to_i
      if target > $ALL_FIGHTERS.length - 1
        puts "You missed!"
      else
      $ALL_FIGHTERS.each do |f|
        if f.name == player.name
          puts "Attacked yourself"
        else
          puts f.name
        end
      end
      player.attack($ALL_FIGHTERS[target])
    end
      # player.attack(t)
    elsif answer == 2
      puts 'Skipping Turn...'
    elsif answer == 3
      puts 'Existing Game'
      $battle_time = false
    else
      puts 'Invalid Input'
    end
  elsif player.class == Mage
    puts 'Select and Action\n1 - Cast Spell\n2 - Pass\n3 - Quit'
    if answer == 1
      puts '#{player.name} attacked'
      # player.cast_spell(t)
    elsif answer == 2
      puts 'Skipping Turn...'
    elsif answer == 3
      puts 'Existing Game'
      $battle_time = false
    else
      puts 'Invalid Input'
    end
  elsif player.class == Rogue
    puts 'Select and Action\n1 - Stab\n2 - Pass\n3 - Quit'
    if answer == 1
      puts '#{player.name} attacked'
      # player.stab(t)
    elsif answer == 2
      puts 'Skipping Turn...'
    elsif answer == 3
      puts 'Existing Game'
      $battle_time = false
    else
      puts 'Invalid Input'
    end
  end
end

def start_battle(fighters)
  puts "Battle Begins!"
  $battle_time = true
  turn_count = 0
  while $battle_time
    fighters.each do |fighter|
      fighter.ct += fighter.spd
      if fighter.ct >= 100
        puts fighters.each
        take_turn(fighter)
      end
    end
  end
end

eirika = Warrior.new('Eirika')
lute = Mage.new('Lute')
colm = Rogue.new('Colm')

mkEquipment(eirika, 'armor', 'Steel Armor')

# start_battle($ALL_FIGHTERS)
