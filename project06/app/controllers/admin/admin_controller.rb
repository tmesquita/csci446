class Admin::AdminController < ApplicationController
  before_filter :require_user
  filter_resource_access
  filter_access_to :all

end	