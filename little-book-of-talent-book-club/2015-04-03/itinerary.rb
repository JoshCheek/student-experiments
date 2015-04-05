# ruby itinerary.rb meeting1.rb
filename      = ARGV.first
raw_itinerary = File.read(filename)
itinerary     = Itinerary::Dsl.new(raw_itinerary).parse
puts Itinerary::ToHtml.new(itinerary).call