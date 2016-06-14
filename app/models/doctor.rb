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
  Roles = OpenStruct.new surgeon: 'Surgeon', 
                         anesthesiologist: 'Anesthesiologist', 
                         anesthesia_technician: 'Anesthesia Technician'
  
  validates :first_name, :last_name, :firm, 
            :role, presence: true
  validates :firm, inclusion: { in: Firms }
  validates :role, inclusion: { in: Roles.to_h.values }
  validates :resident, inclusion: { in: [true, false] }
  
  has_many :operation_records
  
  scope :surgeons, -> { where(role: Roles.surgeon) }
  scope :anesthesiologists, -> { where(role: [Roles.anesthesiologist, Roles.anesthesia_technician]) }
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
