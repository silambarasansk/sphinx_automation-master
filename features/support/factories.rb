class Factory
  def self.reset_sequences
    Factory.factories.each do |name, factory|
      factory.sequences.each do |name1, sequence|
        sequence.reset
      end
    end
  end

  def sequences
    @sequences
  end

  def sequence(name, &block)
    s = Sequence.new(&block)

    @sequences ||= {}
    @sequences[name] = s

    add_attribute(name) { s.next }
  end

  def reset_sequence(name)
    @sequences[name].reset
  end

  class Sequence
    def reset
      @value = 0
    end
  end
end
