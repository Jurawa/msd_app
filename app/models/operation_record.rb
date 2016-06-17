# == Schema Information
#
# Table name: operation_records
#
#  id                  :integer          not null, primary key
#  patient_id          :integer
#  primary_surgeon_id  :integer
#  anesthesiologist_id :integer
#  operation_date      :date
#  pre_op_diagnosis    :string           is an Array
#  post_op_diagnosis   :string           is an Array
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
  
  CaseTypes = %w(Emergency Elective)
  
  belongs_to :patient
  belongs_to :primary_surgeon, class_name: 'Doctor'
  belongs_to :anesthesiologist, class_name: 'Doctor'
  has_many :complications
  has_and_belongs_to_many :additional_surgeons, class_name: 'Doctor', join_table: 'operation_records_additional_surgeons'
  
  accepts_nested_attributes_for :patient
  accepts_nested_attributes_for :complications, allow_destroy: true
  
  validates :patient, :primary_surgeon, :anesthesiologist, 
            :operation_date, :pre_op_diagnosis, :post_op_diagnosis,
            :case_type, :duration,
            presence: true
  validates :case_type, inclusion: { in: CaseTypes }
  
  after_initialize :init_patient
  before_validation :clean_array_attrs
  
  scope :order_by_date, -> { order('operation_date DESC') }
  
  def self.op_durations
    (900...58500).step(900).to_a.map { |d| [Time.at(d).utc.to_s(:time), d] }
  end
  
  def self.existing_procedures
    pluck(:procedures).flatten.compact.uniq
  end
  
  def self.existing_diagnoses
    pluck(:pre_op_diagnosis, :post_op_diagnosis).flatten.compact.uniq
  end
  
  def duration_in_hours_minutes
    Time.at(duration).utc.to_s(:time)
  end
  
  def short_desc
    "#{operation_date} | Patient: #{patient.reg_no} | Primary surgeon: #{primary_surgeon.full_name}"
  end
  
  
private
  
  def init_patient
    patient ||= Patient.new
  end
    
  def clean_array_attrs
    [:procedures, :pre_op_diagnosis, :post_op_diagnosis].each do |array_attr|
      send(array_attr).reject!(&:blank?) if send(array_attr)
    end
  end
end
