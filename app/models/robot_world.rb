class RobotWorld
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite('db/robot_world_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/robot_world_development.sqlite3')
    end
  end

  def self.table
    database.from(:robots)
  end

  def self.create(robot)
    table.insert(robot)
  end

  def self.all
    table.map { |data| Robot.new(data) }
  end

  def self.find(id)
    robot = table.where(:id => id).to_a.first
    Robot.new(robot)
  end

  def self.update(id, data)
    table.where(:id => id).update(data)
  end

  def self.delete(id)
    table.where(:id => id).delete
  end

  def self.delete_all
    table.delete
  end
end
