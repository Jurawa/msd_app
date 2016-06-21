# == Schema Information
#
# Table name: complications
#
#  id                  :integer          not null, primary key
#  operation_record_id :integer
#  description         :string
#  wound_infection     :boolean
#  death               :boolean
#  preventable         :boolean
#  death_preventable   :boolean
#  anesthesia_related  :boolean
#  error_type          :string           is an Array
#  error_grade         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_complications_on_operation_record_id  (operation_record_id)
#
# Foreign Keys
#
#  fk_rails_bf03b390c7  (operation_record_id => operation_records.id)
#

class Complication < ActiveRecord::Base
  
  ErrorTypes = ['Technical', 'Judgement', 'Systems', 'Knowledge Deficit', 'Other (explain in description)']
  ErrorGrades = %w(I II IIIa IIIb IVa IVb V)
  ErrorGradesWithSuffix = ErrorGrades.map { |g| [g, "#{g}-d"] }.flatten
  
  belongs_to :operation_record
end
