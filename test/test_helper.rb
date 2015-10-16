ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'tilt/erb'

DatabaseCleaner[:sequel, { :connection => Sequel.sqlite("db/robot_world_test.sqlite3") }].strategy = :truncation

class Minitest::Test
  def teardown
    RobotWorld.delete_all
  end

  def create_robots(num)
  num.times do |i|
    RobotWorld.create({ :name        => "#{i+1} name",
                         :birthdate  => "#{i+1} birthdate",
                         :city       => "#{i+1} city",
                         :state      => "#{i+1} state",
                         :avatar     => "#{i+1} avatar",
                         :date_hired => "#{i+1} date_hired",
                         :department => "#{i+1} department"
                         })
  end
end

end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
