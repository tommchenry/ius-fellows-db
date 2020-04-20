# == Schema Information
#
# Table name: fellows
#
#  id                    :bigint           not null, primary key
#  academic_discipline   :string
#  address_1             :string
#  address_2             :string
#  affiliation           :string
#  board_dir             :boolean
#  city                  :string
#  consulting            :string
#  council               :string
#  country               :string
#  date_joined           :date
#  date_terminated       :date
#  email                 :string
#  ethnicity             :string
#  fax                   :string
#  fellow_type           :string
#  first_name            :string
#  gender                :string
#  home_telephone        :string
#  include_in_roster     :boolean
#  last_dues_paid        :string
#  last_name             :string
#  list_maker            :boolean
#  nationality           :string
#  position              :string
#  reason_terminated     :string
#  report_to_transaction :string
#  state                 :string
#  status                :string
#  title                 :string
#  transaction_number    :string
#  transaction_status    :string
#  work_telephone        :string
#  zip_code              :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  fellow_id             :integer
#
class Fellow < ApplicationRecord
  has_many :deposits, foreign_key: :fellow_id, primary_key: :fellow_id
end
