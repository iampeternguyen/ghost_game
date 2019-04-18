  attr_reader :name

  def initialize (name)
    @name=name
  end

  def guess

  end

  def alert_invalid_guess
    puts "Does not match word in dictionary. Try again #{@name}."
  end
end