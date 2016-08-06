class Garden
  SEEDS = { "R" => "radishes", "C" => "clover", "V" => "violets", "G" => "grass" }

  CHILDREN = %w(alice bob charlie david eve fred ginny harriet ileana joseph
                kincaid larry)

  def initialize(diagram)
    @diagram = diagram.split("\n")
    @children_hash = create_children_hash
  end

  def create_children_hash
    index = 0
    CHILDREN.each_with_object(Hash.new("")) do |child, hash|
      hash[child.to_sym]
      first_row = @diagram.first.slice(index..index + 1)
      second_row = @diagram.last.slice(index..index + 1)

      hash[child.to_s] = first_row unless first_row.nil?
      hash[child.to_s] += second_row unless second_row.nil?

      index += 2
    end
  end

  def self.class_eval()
end

# def alice
  # @children_hash["#{__method__}"].chars.map { |char| SEEDS[char].to_sym }
# end

def students(*attributes)
  attributes.each do |attribute|
    attr_methods = %Q{
      def #{attribute}
        @children_hash["#{attribute}"].chars.map { |char| SEEDS[char].to_sym }
      end
    }
    class_eval(attr_methods)
  end
end
