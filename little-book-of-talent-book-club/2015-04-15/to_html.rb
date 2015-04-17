require 'date'

class Dsl
  class Review
    attr_accessor :tip_name, :date, :location, :snacks

    def initialize(tip_name)
      self.tip_name = tip_name
    end

    def to_struct
      Bookclub::Review.new(tip_name, date, location, snacks)
    end

    def details(date:, location:, snacks:)
      self.date     = Date.parse(date)
      self.location = location
      self.snacks   = snacks
    end

    def bring(*)
    end

    def agenda(*)
    end
  end

  def self.bookclub(bookclub_dsl)
    new.eval(bookclub_dsl).bookclub
  end

  attr_reader :reviews

  def initialize
    @reviews = []
  end

  def bookclub
    Bookclub.new(reviews.map &:to_struct)
  end

  def eval(bookclub_dsl)
    binding.eval bookclub_dsl
    self
  end

  def review(tip_name, &block)
    review = Review.new(tip_name)
    review.instance_eval(&block)
    reviews << review
  end
end

class Bookclub
  class Review
    attr_accessor :tip_name, :date, :location, :snacks
    def initialize(tip_name, date, location, snacks)
      self.tip_name = tip_name
      self.date     = date
      self.location = location
      self.snacks   = snacks
    end
  end

  attr_accessor :reviews
  def initialize(reviews)
    self.reviews = reviews
  end
end


module ToHtml
  def self.call(bookclub)
    html = "<!Doctype html>\n"
    html << "<html>\n"
    html << "  <head>\n"
    html << "    <tile>Book club!</title>\n"
    html << "  </head>\n"
    html << "  <body>\n"
    html << "    <ol>\n"

    bookclub.reviews.each do |review|
      html << "      <li>#{review.tip_name}\n"
      html << "        <dl>\n"
      html << "          <dt>Date</dt><dd>#{review.date}</dd>\n"
      html << "          <dt>Location</dt><dd>#{review.location}</dd>\n"
      html << "          <dt>Snacks</dt><dd>#{review.snacks}</dd>\n"
      html << "        </dl>\n"
      html << "      </li>\n"
    end

    html << "    </ol>\n"
    html << "  </body>\n"
    html << "</html>\n"
  end
end

# invoked: ruby to_html.rb bookclub_dsl.rb
# success: print out html version of bookclub_dsl <html>...

file_name    = ARGV.first
bookclub_dsl = File.read file_name
bookclub     = Dsl.bookclub bookclub_dsl
html         = ToHtml.call bookclub
puts html
