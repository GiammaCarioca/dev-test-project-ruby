# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.upload(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true, header_converters: :symbol, encoding: 'UTF-8') do |row|
      assign_from_row(row).save
    end

    check_total_items(self.count)
  end

  def self.check_total_items(count)
    puts "Total: #{count} #{self.to_s.pluralize}."
  end

end
