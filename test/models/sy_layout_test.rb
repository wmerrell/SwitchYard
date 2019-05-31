# == Schema Information
#
# Table name: sy_layouts
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  owner       :string
#  description :text
#  created_by  :string           not null
#  updated_by  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SyLayoutTest < ActiveSupport::TestCase
  test 'the truth' do
    print "\nModel:SyLayout the truth"
    assert true
  end

  # TODO: Add Module tests
end
