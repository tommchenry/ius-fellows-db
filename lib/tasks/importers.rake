require 'csv'
require 'net/http'

FILENAME = "https://ius-fellows-db.s3.us-east-2.amazonaws.com/IUS+Database+April+2020.csv"

namespace :fellows do
  desc "Import Fellows from CSV"
  task :import_from_csv => :environment do |t|
    tmp_file_name = "#{Rails.root}/tmp/fellows_db.csv"

    uri = URI(FILENAME)
    resp = Net::HTTP.get(uri)
    open(tmp_file_name, "wb") do |file|
      file.write(resp)
    end
    puts "File Downloaded."

    count = 0
    CSV.foreach(tmp_file_name, headers: true) do |row|
      count += 1
      date_joined = Date.parse(row["Date Joined IUS"]) if row["Date Joined IUS"]
      date_terminated = Date.parse(row["Date Terminated"]) if row["Date Terminated"]

      Fellow.create!(
        academic_discipline: row["Acadmic Discipline"], 
        address_1: row["Address1"],
        address_2: row["Address2"],
        affiliation: row["Affiliation"],
        board_dir: row["BoardDir"].to_s.downcase == "true",
        city: row["City"],
        consulting: row["Consulting"],
        council: row["Council"],
        country: row["Country"] || "US",
        date_joined: date_joined,
        date_terminated: date_terminated,
        email: row["Email text"],
        ethnicity: row["Ethnicity"],
        fax: row["Fax"],
        fellow_type: row["Fellow Type"],
        first_name: row["Firstname"],
        gender: row["Gender"]&.upcase,
        home_telephone: row["HomeTel"],
        include_in_roster: row["Include in Roster"] == "yes",
        last_dues_paid: row["Last Dues Paid"],
        last_name: row["Lastname"],
        list_maker: row["List Maker"].downcase == "true",
        nationality: row["Nationality"],
        position: row["Position"],
        reason_terminated: row["Reason Terminated"],
        report_to_transaction: row["Report to Transaction"],
        state: row["State"],
        status: row["Status"]&.capitalize,
        title: row["Title"],
        transaction_number: row["Transaction Number"],
        transaction_status: row["Transaction Status"],
        work_telephone: row["WorkTel"],
        zip_code: row["Zip"],
        fellow_id: row["Fellow ID"],
      )
    end
    puts "File Imported. #{count} fellows created."
  end
end

