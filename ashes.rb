
Dream_Creator = Struct.new(:size, :people, :strangers, :tears)

base_size = 1000000 + rand(999999)

base_people = 2000000 - base_size + rand(10000) + 5000

base_strangers = (base_size / 10000) + (base_people / 100)

base_tears = (base_people % 3) + 1

$focus = 10
$holder = 'h'

dream = Dream_Creator.new(base_size, base_people, base_strangers, base_tears) 
p "start:"
p dream


def morning(dream)
  system("clear")
  
  print "Good morning, Author."
  report(dream)
end

def report(dream)
  print "\n  The Dream is #{dream.size} arks today."
  print "\n  It contains #{dream.people} loyal figments."
  print "\n  You must contend with #{dream.strangers} strangers."
  print "\n  The dream has been torn in #{dream.tears} places."
end

def evening(dream)
  dream.size = dream.size - (dream.size / 1000)
  dream.size -= rand(dream.strangers)
  dream.people += ((dream.people/4)/270)
  dream.strangers += ((dream.strangers/4)/270) + (dream.tears * 10)
  dream.people -= rand(dream.strangers/4)
  dream.tears += (dream.people % 3)
  return dream
end

def hunt(dream)
  system("clear")
  dream.strangers -= 100
  if dream.strangers < 1
    dream.strangers = 1
  end
  return dream
end

def fix(dream)
  system("clear")
  dream.tears -= 5
  if dream.tears < 0
    dream.tears = 0
  end
  return dream
end

def create_figments(dream)
  system("clear")
  dream.people += 1000
  if dream.people < 0
    dream.people = 0
  end
  return dream
end

def expand(dream)
  system("clear")
  dream.size += 10000
  if dream.size < 0
    dream.size = 0
  end
  return dream
end

def decision(dream)
  puts "\n\nYou have #{$focus} focus remaining."
  puts "\nh: hunt strangers"
  puts "\nf: fix tears"
  puts "\nc: create figments"
  puts "\ne: expand dream"
  puts "\nintervention (enter to repeat last action):"
  choice = gets.chomp
  $holder = choice if choice =~/^(h|f|c|e)$/
  choice = $holder if choice == ''
  
  dream = hunt(dream) if choice == 'h'
  dream = fix(dream) if choice == 'f'
  dream = create_figments(dream) if choice == 'c'
  dream = expand(dream) if choice == 'e'
  
  $focus -= 1
  return dream
end

def day(dream)
  p dream
  morning(dream)
  dream = decision(dream)
  until(dream.strangers > dream.people or dream.size < dream.people or dream.tears > dream.size or $focus == 0)
    report(dream)
    dream = decision(dream)
    dream = evening(dream)
  end
  if(dream.strangers > dream.people or dream.size < dream.people or dream.tears > dream.size)
    system("clear")
    puts "darkness engulfs you"
    abort()
  end
  return dream
end

until(dream.strangers > dream.people or dream.size < dream.people or dream.tears > dream.size)
  $focus = 10
  p dream
  dream = day(dream)
end

system("clear")
puts "darkness engulfs you"
abort()
