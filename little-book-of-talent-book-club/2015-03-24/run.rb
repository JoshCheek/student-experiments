require 'date'

module Bookclub
  class Structure
    attr_reader :children

    def initialize
      @children = []
    end

    def add_meeting(number, date)
      meeting = Meeting.new(number, date)
      @children << meeting
      meeting
    end

    def add_snacks(snackateers)
      snack = Snack.new(snackateers)
      @children << snack
      snack
    end

    def add_tip(number, name)
      tip = Tip.new(number, name)
      @children << tip
      tip
    end
  end

  class Meeting < Structure
    attr_reader :number, :date
    def initialize(number, date)
      @number, @date = number, date
      super()
    end
  end

  class Snack < Structure
    attr_reader :snackateers
    def initialize(snackateers)
      @snackateers = snackateers
      super()
    end
  end

  class Tip < Structure
    attr_reader :number, :name
    def initialize(number, name)
      @number, @name = number, name
      super()
    end
  end




  class DSL
    attr_reader :structure

    def initialize(&block)
      @structure    = Structure.new
      @current_node = @structure
      instance_eval(&block)
    end

    def meeting(number, date:, &block)
      substructure @structure.add_meeting(number, Date.parse(date)),
                   &block
    end

    def snacks(snackateers, &block)
      substructure @current_node.add_snacks(snackateers),
                   &block
    end

    def tip(number, name, &block)
      substructure @current_node.add_tip(number, name),
                   &block
    end

    def ponder(*)
    end

    def perform(*)
    end

    def takeaway(*)
    end

    private

    def substructure(substructure, &block)
      current = @current_node
      @current_node = substructure
      block.call if block
    ensure
      @current_node = current
    end
  end


  class RenderAsText
    require 'pp'
    def self.call(structure, indentation=0)
      text = '  ' * indentation
      case structure
      when Meeting
        text << "Meeting number #{structure.number} on #{structure.date.strftime('%Y-%m-%d')}\n"
      when Snack
        text << "Snacks:\n"
        structure.snackateers.each do |name, snack|
          text << ('  ' * indentation.next)
          text << "#{name} brings #{snack}\n"
        end
      when Tip
        text << "Tip #{structure.number}: #{structure.name}\n"
      end
      structure.children.each do |child|
        text << call(child, indentation + 1)
      end
      text
    end
  end
end

filename = ARGV.first
dsl      = eval File.read(filename), binding, filename
puts Bookclub::RenderAsText.call(dsl.structure)
puts Bookclub::RenderAsHTML.call(dsl.structure)
