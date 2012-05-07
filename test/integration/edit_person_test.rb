require 'test_helper'

class EditPersonTest < ActionDispatch::IntegrationTest
  test "optional dob" do
    visit edit_person_path(people(:one))

    # 1i = year, as generated by the date_select view helper
    select '', :from => 'person[date_of_birth(1i)]'

    click_button 'Save'

    assert page.has_content?('successfully'),
    'Person was not updated.'
    assert !page.has_content?('2012'),
    'Date of birth was not modified.'
    assert !page.has_content?('2007'),
    'Date of birth was set to first year (no empty option).'
  end
end
