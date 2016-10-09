class Guest

  attr_reader(:guest_name, :guest_money, :guest_age)

  def initialize(guest_name, guest_money, guest_age)
    @guest_name = guest_name
    @guest_money = guest_money
    @guest_age = guest_age
  end

end