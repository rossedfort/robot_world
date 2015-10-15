require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_robots_have_the_right_attributes
    robot = Robot.new({"id"         => "1",
                       "name"       => "Ross",
                       "birthdate"  => "1993-04-01",
                       "city"       => "Somerset",
                       "state"      => "New Jersey",
                       "avatar"     => "rossisthecoolest",
                       "date_hired" => "2015-10-13",
                       "department" => "Tech"
                       })

   assert_equal "1", robot.id
   assert_equal "Ross", robot.name
   assert_equal "1993-04-01", robot.birthdate
   assert_equal "Somerset", robot.city
   assert_equal "New Jersey", robot.state
   assert_equal "rossisthecoolest", robot.avatar
   assert_equal "2015-10-13", robot.date_hired
   assert_equal "Tech", robot.department
  end
end
