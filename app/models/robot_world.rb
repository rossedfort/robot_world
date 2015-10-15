require 'yaml/store'

class RobotWorld
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= YAML::Store.new('db/robot_world_test')
    else
      @database ||= YAML::Store.new('db/robot_world')
    end
  end

  def self.create(robot)
  database.transaction do
        database['robots'] ||= []
        database['total'] ||= 0
        database['total'] += 1
        database['robots'] << { 'id'         => database['total'],
                                'name'       => robot[:name],
                                'city'       => robot[:city],
                                'state'      => robot[:state],
                                'avatar'     => robot[:avatar],
                                'birthdate'  => robot[:birthdate],
                                'date_hired' => robot[:date_hired],
                                'department' => robot[:department]
                              }
      end
  end

  def self.raw_bots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_bots.map { |data| Robot.new(data) }
  end

  def self.raw_bot(id)
    raw_bots.find { |robot| robot["id"] == id }
  end

  def self.find(id)
    Robot.new(raw_bot(id))
  end

  def self.update(id, data)
    database.transaction do
      target = database['robots'].find {|robot| robot["id"] == id}
      target['name']       = data[:name]
      target['birthdate']  = data[:birthdate]
      target['city']       = data[:city]
      target['state']      = data[:state]
      target['avatar']     = data[:avatar]
      target['date_hired'] = data[:date_hired]
      target['department'] = data[:department]
    end
  end

  def self.delete(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end

  def self.delete_all
    database.transaction do
      database['tasks'] = []
      database['total'] = 0
    end
  end
end
