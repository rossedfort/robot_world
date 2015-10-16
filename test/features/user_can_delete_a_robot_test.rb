require_relative '../test_helper'

class DeleteBotTest < FeatureTest
  def test_a_robot_can_be_deleted
    create_robots(1)
    robot = RobotWorld.all.first

    visit "/bots/#{robot.id}"

    click_button('delete')

    assert '/bots', current_path
    within('#robots') do
      refute page.has_content?(1)
      refute page.has_content?('Ross')
    end
  end
end
