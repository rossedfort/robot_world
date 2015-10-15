require_relative '../test_helper'

class DeleteBotTest < FeatureTest
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

    visit '/bots/1'

    click_button('delete')

    assert '/bots', current_path
    within('#robots') do
      refute page.has_content?(1)
      refute page.has_content?('Ross')
    end
  end
end
