# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    session[:offset] = Purchase.all.size
  end

  def upload
    if params[:file].blank?
      flash[:alert] = 'Please select a file to upload'
      redirect_to root_path
    else
      Customer.upload params[:file]
      Vendor.upload params[:file]
      Product.upload params[:file]
      Purchase.upload params[:file]

      flash[:success] = 'File uploaded successfully'
      redirect_to report_path
    end
  end

  def report
    @purchases = Purchase.all
  end
end
