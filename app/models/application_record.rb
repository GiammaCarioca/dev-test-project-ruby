# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.upload(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true, header_converters: :symbol, encoding: 'UTF-8') do |row|
      item = assign_from_row(row).save

      report(item)
    end
  end

  def self.report(item)
    counter = 0

      if item
        counter += 1
      else
        puts self.errors.full_messages.join(',').to_s
      end

      puts "Imported #{counter} #{self.to_s}."
  end

end
