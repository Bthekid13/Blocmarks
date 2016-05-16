# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  bookmark_id            :integer
#
# Indexes
#
#  index_users_on_bookmark_id           (bookmark_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it_behaves_like "it has attributes", User,
  {
    id: :integer,
    first_name: :string,
    last_name: :string,
    email: :string,
    encrypted_password: :string,
    reset_password_token: :string,
    reset_password_sent_at: :datetime,
    remember_created_at: :datetime,
    sign_in_count: :integer,
    current_sign_in_at: :datetime,
    last_sign_in_at: :datetime,
    current_sign_in_ip: :string,
    last_sign_in_ip: :string,
    confirmation_token: :string,
    confirmed_at: :datetime,
    confirmation_sent_at: :datetime,
    unconfirmed_email: :string,
    created_at: :datetime,
    updated_at: :datetime,
    bookmark_id: :integer
    } {}
  end
