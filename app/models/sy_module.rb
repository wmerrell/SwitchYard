# == Schema Information
#
# Table name: sy_modules
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  owner       :string
#  module_type :string
#  length      :integer
#  width       :integer
#  description :text
#  created_by  :string           not null
#  updated_by  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SyModule < ApplicationRecord
end
