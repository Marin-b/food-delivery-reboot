class BaseView
  # element.to_string will call the to_string method of the element class
  # Have a look in the models ;)

  def display(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1}. #{element.to_string}"
    end
  end

  def ask_for(something)
    puts "Give us #{something}"
    gets.chomp
  end
end
