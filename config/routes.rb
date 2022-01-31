# frozen_string_literal: true

Rails.application.routes.draw do
  get 'report', to: 'pages#report'
  post '/', to: 'pages#upload'

  root 'pages#home'
end
