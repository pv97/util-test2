@utilities.each do |utility|
  json.set! utility.id do
    json.partial! 'utility', utility: utility
  end
end
