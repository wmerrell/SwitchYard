require 'application_system_test_case'

class SyLayoutsTest < ApplicationSystemTestCase
  setup do
    @sy_layout = sy_layouts(:one)
  end

  test 'visiting the index' do
    visit sy_layouts_url
    assert_selector 'h1', text: 'Layouts'
  end

  test 'creating a Layout' do
    visit sy_layouts_url
    click_on 'New Layout'

    fill_in 'Name', with: @sy_layout.name
    fill_in 'Owner', with: @sy_layout.owner
    click_on 'Create Layout'

    assert_text 'Layout was successfully created'
    click_on 'Back'
  end

  test 'updating a Layout' do
    visit sy_layouts_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @sy_layout.name
    fill_in 'Owner', with: @sy_layout.owner
    click_on 'Update Layout'

    assert_text 'Layout was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Layout' do
    visit sy_layouts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Layout was successfully destroyed'
  end
end
