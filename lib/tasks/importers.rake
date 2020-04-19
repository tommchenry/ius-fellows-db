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

DEPOSITS_FILENAME = "https://ius-fellows-db.s3.us-east-2.amazonaws.com/IUS+Deposits+April+2020.csv"

namespace :deposits do
  desc "Import Deposits from CSV"
  task :import_from_csv => :environment do |t|
    tmp_file_name = "#{Rails.root}/tmp/fellows_db.csv"

    uri = URI(DEPOSITS_FILENAME)
    resp = Net::HTTP.get(uri)
    open(tmp_file_name, "wb") do |file|
      file.write(resp)
    end
    puts "File Downloaded."

    count = 0
    CSV.foreach(tmp_file_name, headers: true) do |row|
      count += 1
      date_processed = Date.parse(row["Date Processed"]) if row["Date Processed"]
      check_date = Date.parse(row["Check Date"]) if row["Check Date"]
      gift = if row["Gifts"]
               row["Gifts"].gsub("$","").gsub(",","").gsub(".","_").gsub("(","").gsub(")","")
             else
               "0_00"
             end
      amount = if row["Amount"]
                 row["Amount"].gsub("$","").gsub(",","").gsub(".","_").gsub("(","").gsub(")","")
               else
                 "0_00"
               end

      Deposit.create!(
        deposit_number: row["Deposit Number"],
        date_processed: date_processed,
        check_number: row["Check #"],
        fellow_id: row["Fellow ID"].to_i,
        fellow_number: row["FellowNumber"].to_i,
        check_date: check_date,
        payment_by: row["Payment by"],
        payment_type: row["Payment Type"],
        deposit_type: row["Type"],
        gift_amount_cents: gift,
        period: row["Period"],
        amount_cents: amount,
        last_name: row["Lastname"]
      )
    end
    puts "File Imported. #{count} deposits created."
  end
end

