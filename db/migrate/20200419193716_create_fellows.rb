class CreateFellows < ActiveRecord::Migration[6.0]
  def change
    create_table :fellows do |t|
      t.integer :fellow_id
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :work_telephone
      t.string :home_telephone
      t.string :fax
      t.string :email
      t.string :gender
      t.string :ethnicity
      t.string :nationality
      t.string :fellow_type
      t.string :academic_discipline
      t.string :consulting
      t.string :affiliation
      t.string :position
      t.string :last_dues_paid
      t.string :council
      t.boolean :board_dir
      t.string :status
      t.string :transaction_status
      t.string :transaction_number
      t.string :report_to_transaction
      t.boolean :list_maker
      t.date :date_joined
      t.boolean :include_in_roster
      t.string :reason_terminated
      t.date :date_terminated

      t.timestamps
    end
  end
end
