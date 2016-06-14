# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  firm       :integer
#  role       :string
#  resident   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Doctor < ActiveRecord::Base
  
  Firms = [1, 2]
  Roles = ['Surgeon', 'Anesthesiologist', 'Anesthesia Technician']
  
  validates :first_name, :last_name, :firm, 
            :role, presence: true
  validates :firm, inclusion: { in: Firms }
  validates :role, inclusion: { in: Roles }
  validates :resident, inclusion: { in: [true, false] }
  
  has_many :operation_records
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
