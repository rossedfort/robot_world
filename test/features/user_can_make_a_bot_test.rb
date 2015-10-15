require_relative '../test_helper'

class MakeBotTest < FeatureTest
  def test_a_user_can_create_a_robot
    visit '/bots/new'

    fill_in('robot[name]', with: 'Ross')
    fill_in('robot[birthdate]', with: '1993-01-04')
    fill_in('robot[city]', with: 'Somerset')
    fill_in('robot[state]', with: 'New Jersey')
    fill_in('robot[avatar]', with: 'rossisthecoolest')
    fill_in('robot[date_hired]', with: '2015-10-13')
    select('Tech', from: 'robot[department]')
    click_button('submit')

    assert_equal '/bots', current_path

    robots = RobotWorld.all

    assert_equal 1, robots.count
  end
end
