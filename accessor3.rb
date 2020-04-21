class India

  def demo_publ
    demo_nri
    demo_states
    puts "we are indians"
  end

  def demo_delhi_publ
    puts "I am too Indian public"
  end

  private

  def demo_nri
    puts "Hi am also Indian from NRI ppl"
  end

  protected

  def demo_states
    puts "we are also Indian from all states"
  end
end


class IndiaState < India

  def states

    puts "30 states in india"
    teritory

    inside_india_states = IndiaState.new
    inside_india_states.demo_nri rescue p "You can't Access!"
    inside_india_states.demo_states
  end

  private

  def teritory
    puts "we are also bilongs india"
  end
end

india_states = IndiaState.new

india_states.states

india = India.new
india.demo_publ