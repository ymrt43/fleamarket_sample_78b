json.array! @children do |child|
  json.id child.id
  json.name child.name
end

json.array! @grandchildren do |gc|
  json.id gc.id
  json.name gc.name
end