require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  def test_a_robot_can_be_created
    RobotWorld.create({:id         => 1,
                       :name       => "Ross",
                       :birthdate  => "1993-04-01",
                       :city       => "Somerset",
                       :state      => "New Jersey",
                       :avatar     => "rossisthecoolest",
                       :date_hired => "2015-10-13",
                       :department => "Tech"
                       })

    robot = RobotWorld.find(1)

    assert_equal 1, robot.id
    assert_equal "Ross", robot.name
    assert_equal "1993-04-01", robot.birthdate
    assert_equal "Somerset", robot.city
    assert_equal "New Jersey", robot.state
    assert_equal "rossisthecoolest", robot.avatar
    assert_equal "2015-10-13", robot.date_hired
    assert_equal "Tech", robot.department
  end

  def test_a_robot_can_be_edited
    RobotWorld.create({:id         => 1,
                       :name       => "Ross",
                       :birthdate  => "1993-04-01",
                       :city       => "Somerset",
                       :state      => "New Jersey",
                       :avatar     => "rossisthecoolest",
                       :date_hired => "2015-10-13",
                       :department => "Tech"
                       })

    RobotWorld.update(1, {:name       => "Bob",
                          :birthdate  => "1990-12-31",
                          :city       => "Denver",
                          :state      => "Colorado",
                          :avatar     => "bobiscooltoo",
                          :date_hired => "2012-09-21",
                          :department => "Nap Management"
                          })

    robot = RobotWorld.find(1)

    assert_equal 1, robot.id
    assert_equal "Bob", robot.name
    assert_equal "1990-12-31", robot.birthdate
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "bobiscooltoo", robot.avatar
    assert_equal "2012-09-21", robot.date_hired
    assert_equal "Nap Management", robot.department
  end

  def test_a_robot_can_be_deleted
    RobotWorld.create({:id         => 1,
                       :name       => "Ross",
                       :birthdate  => "1993-04-01",
                       :city       => "Somerset",
                       :state      => "New Jersey",
                       :avatar     => "rossisthecoolest",
                       :date_hired => "2015-10-13",
                       :department => "Tech"
                       })

    RobotWorld.create({:id         => 2,
                       :name       => "Bob",
                       :birthdate  => "1990-12-31",
                       :city       => "Denver",
                       :state      => "Colorado",
                       :avatar     => "bobiscooltoo",
                       :date_hired => "2012-09-21",
                       :department => "Nap Management"
                       })

    RobotWorld.delete(2)

    robots = RobotWorld.all

    assert_equal 1, robots.count
  end


end
