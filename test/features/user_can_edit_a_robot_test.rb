require_relative '../test_helper'

class EditBotTest < FeatureTest
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

    visit '/bots/1'
    assert_equal '/bots/1', current_path

    click_link('edit')

    assert_equal '/bots/1/edit', current_path

    fill_in('robot[name]', with: 'Bob')
    fill_in('robot[birthdate]', with: '1990-12-31')
    fill_in('robot[city]', with: 'Denver')
    fill_in('robot[state]', with: 'Colorado')
    fill_in('robot[avatar]', with: 'bobiscooltoo')
    fill_in('robot[date_hired]', with: '2014-09-21')
    select('Snack Management', from: 'robot[department]')
    click_button('submit')

    assert '/bots', current_path
    visit '/bots/1'

    within('#info') do
      assert page.has_content?('Bob')
      assert page.has_content?('1990-12-31')
      assert page.has_content?('Denver')
      assert page.has_content?('Colorado')
      assert page.has_content?('2014-09-21')
      assert page.has_content?('Snack Management')
    end
  end
end
