ActiveAdmin.register Deposit do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :deposit_number, :date_processed, :check_number, :fellow_id, :fellow_number, :check_date, :payment_by, :payment_type, :deposit_type, :gift_amount_cents, :gift_amount_currency, :period, :amount_cents, :amount_currency, :last_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:deposit_number, :date_processed, :check_number, :fellow_id, :fellow_number, :check_date, :payment_by, :payment_type, :deposit_type, :gift_amount_cents, :gift_amount_currency, :period, :amount_cents, :amount_currency, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :deposit_number
    column :date_processed
    column :check_number
    column :fellow_id
    column :check_date
    column :payment_by
    column :deposit_type
    column :gift_amount
    column :period
    column :amount
    actions
  end
  
end
