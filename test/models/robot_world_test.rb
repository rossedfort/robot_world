require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  def test_a_robot_can_be_created
    create_robots(1)

    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal "1 name", robot.name
    assert_equal "1 birthdate", robot.birthdate
    assert_equal "1 city", robot.city
    assert_equal "1 state", robot.state
    assert_equal "1 avatar", robot.avatar
    assert_equal "1 date_hired", robot.date_hired
    assert_equal "1 department", robot.department
  end

  def test_a_robot_can_be_edited
    create_robots(1)
    RobotWorld.update(RobotWorld.all.first.id, {:name => "Bob",
                                                :birthdate => "1990-12-31",
                                                :city => "Denver",
                                                :state => "Colorado",
                                                :avatar => "bobiscooltoo",
                                                :date_hired => "2012-09-21",
                                                :department => "Nap Management"
                                                })

    robot = RobotWorld.find(RobotWorld.all.first.id)

    assert_equal "Bob", robot.name
    assert_equal "1990-12-31", robot.birthdate
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "bobiscooltoo", robot.avatar
    assert_equal "2012-09-21", robot.date_hired
    assert_equal "Nap Management", robot.department
  end

  def test_a_robot_can_be_deleted
    create_robots(3)
    total = RobotWorld.all.count

    RobotWorld.delete(RobotWorld.all.first.id)

    robots = RobotWorld.all

    assert_equal (total -1), RobotWorld.all.count
  end


end
