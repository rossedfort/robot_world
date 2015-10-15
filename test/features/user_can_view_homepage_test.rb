require_relative '../test_helper'

class ViewHomeTest < FeatureTest
  def test_a_user_can_view_the_homepage
    visit '/'
    assert_equal '/', current_path

    within('#greeting') do
      assert page.has_content?('Welcome to Robot World!')
    end

    within('#options') do
      assert page.has_content?('Press here to see all the Robots')
      assert page.has_content?('Press here to add a new Robot')
      assert page.has_content?('Press here to view the dashboard')
    end
  end
end
