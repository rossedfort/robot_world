class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate_day,
              :birthdate_year,
              :birthdate_month,
              :date_hired,
              :department

  def initialize(data)
    @id                 = data["id"]
    @name               = data["name"]
    @city               = data["city"]
    @state              = data["state"]
    @avatar             = data["avatar"]
    @birthdate_day      = data["birthdate_day"]
    @birthdate_year     = data["birthdate_year"]
    @birthdate_month    = data["birthdate_month"]
    @date_hired         = data["date_hired"]
    @department         = data["department"]
  end
end
