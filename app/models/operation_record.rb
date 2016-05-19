# == Schema Information
#
# Table name: operation_records
#
#  id                  :integer          not null, primary key
#  patient_id          :integer
#  primary_surgeon_id  :integer
#  anesthesiologist_id :integer
#  operation_date      :date
#  pre_op_diagnosis    :string
#  post_op_diagnosis   :string
#  procedures          :string           is an Array
#  case_type           :string
#  reoperation         :boolean
#  duration            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_operation_records_on_anesthesiologist_id  (anesthesiologist_id)
#  index_operation_records_on_patient_id           (patient_id)
#  index_operation_records_on_primary_surgeon_id   (primary_surgeon_id)
#

class OperationRecord < ActiveRecord::Base
  
  Procedures = %w(procedure1 procedure2 procedure3 procedure4 procedure5)
  CaseTypes = %w(type1 type2 type3)
  
  belongs_to :patient
  belongs_to :primary_surgeon, class_name: 'Doctor'
  belongs_to :anesthesiologist, class_name: 'Doctor'
  has_and_belongs_to_many :additional_surgeons, class_name: 'Doctor', join_table: 'operation_records_additional_surgeons'
  
  validates :patient, :primary_surgeon, :anesthesiologist, 
            :operation_date, :pre_op_diagnosis, :post_op_diagnosis,
            :procedures, :case_type, :duration,
            presence: true
  
  before_validation :clean_procedures
  
  def self.op_durations
    (900...18000).step(900).to_a.map { |d| [Time.at(d).utc.to_s(:time), d] }
  end
  
  
private
  
  def clean_procedures
    procedures.reject!(&:blank?) if procedures
  end
end
