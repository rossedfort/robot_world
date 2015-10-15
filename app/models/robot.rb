class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate_day,
              :birthdate_year,
              :birthdate_month,
              :date_hired_day,
              :date_hired_month,
              :date_hired_year,
              :department

  def initialize(data)
    @id                = data["id"]
    @name              = data["name"]
    @city              = data["city"]
    @state             = data["state"]
    @avatar            = data["avatar"]
    @birthdate_day     = data["birthdate_day"]
    @birthdate_year    = data["birthdate_year"]
    @birthdate_month   = data["birthdate_month"]
    @date_hired_day    = data["date_hired_day"]
    @date_hired_month  = data["date_hired_month"]
    @date_hired_year   = data["date_hired_year"]
    @department        = data["department"]
  end
end
