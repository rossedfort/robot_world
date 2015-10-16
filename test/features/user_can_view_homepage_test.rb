require_relative '../test_helper'

class ViewHomeTest < FeatureTest
  def test_a_user_can_view_the_homepage
    visit '/'
    assert_equal '/', current_path

    within('#greeting') do
      assert page.has_content?('Welcome to Robot World!')
    end

  end
end
