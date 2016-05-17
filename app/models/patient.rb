# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  reg_no     :string
#  birth_year :string
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Patient < ActiveRecord::Base
  
  Genders = %w(Male Female)
  
  validates :reg_no, :birth_year, :gender, presence: true
  validates :gender, inclusion: { in: Genders }
  
end
