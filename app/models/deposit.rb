# == Schema Information
#
# Table name: deposits
#
#  id                   :bigint           not null, primary key
#  amount_cents         :integer          default(0), not null
#  amount_currency      :string           default("USD"), not null
#  check_date           :date
#  check_number         :string
#  date_processed       :date
#  deposit_number       :integer
#  deposit_type         :string
#  fellow_number        :integer
#  gift_amount_cents    :integer          default(0), not null
#  gift_amount_currency :string           default("USD"), not null
#  last_name            :string
#  payment_by           :string
#  payment_type         :string
#  period               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  fellow_id            :integer
#
class Deposit < ApplicationRecord
  monetize :amount_cents
  monetize :gift_amount_cents
  belongs_to :fellow, optional: true
end
