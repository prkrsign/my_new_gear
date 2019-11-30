json.array! @increments  do |gear|
  # binding.pry
  json.id      gear.id
  json.name    gear.gearname 
  end