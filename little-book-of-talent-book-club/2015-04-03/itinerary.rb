class Itinerary
  class Dsl
    def self.parse(raw_itinerary)
      Dsl.new.eval(raw_itinerary)
    end

    def eval(raw_itinerary)
      super raw_itinerary
    end

    def name(name)
      @name = name
    end
  end

  module ToHtml
    def self.call(itinerary)
      itinerary
    end
  end
end

# $ ruby itinerary.rb meeting1.rb
filename      = ARGV.first
raw_itinerary = File.read(filename)
itinerary     = Itinerary::Dsl.parse(raw_itinerary)
puts Itinerary::ToHtml.call(itinerary)
