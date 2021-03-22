require 'application_system_test_case'

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test 'visiting the index' do
    visit sections_url
    assert_selector 'h1', text: 'Sy Modules'
  end

  test 'creating a Module' do
    visit sections_url
    click_on 'New Sy Module'

    fill_in 'Name', with: @section.name
    fill_in 'Owner', with: @section.owner
    click_on 'Create Module'

    assert_text 'Module was successfully created'
    click_on 'Back'
  end

  test 'updating a Module' do
    visit sections_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @section.name
    fill_in 'Owner', with: @section.owner
    click_on 'Update Module'

    assert_text 'Module was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Module' do
    visit sections_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Module was successfully destroyed'
  end
end
