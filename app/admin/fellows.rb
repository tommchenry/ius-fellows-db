ActiveAdmin.register Fellow do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :fellow_id, :title, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip_code, :country, :work_telephone, :home_telephone, :fax, :email, :gender, :ethnicity, :nationality, :fellow_type, :academic_discipline, :consulting, :affiliation, :position, :last_dues_paid, :council, :board_dir, :status, :transaction_status, :transaction_number, :report_to_transaction, :list_maker, :date_joined, :include_in_roster, :reason_terminated, :date_terminated
  #
  # or
  #
  # permit_params do
  #   permitted = [:fellow_id, :title, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip_code, :country, :work_telephone, :home_telephone, :fax, :email, :gender, :ethnicity, :nationality, :fellow_type, :academic_discipline, :consulting, :affiliation, :position, :last_dues_paid, :council, :board_dir, :status, :transaction_status, :transaction_number, :report_to_transaction, :list_maker, :date_joined, :include_in_roster, :reason_terminated, :date_terminated]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    column "Fellow ID", :fellow_id
    column :full_name do |fellow|
      link_to fellow.full_name, admin_fellow_path(fellow)
    end
    column :email
    column :fellow_type
    column :last_dues_paid
    column :board_dir
    column :status
    column :date_joined
    actions
  end
end
