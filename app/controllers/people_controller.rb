class PeopleController < ApplicationController
  def index
    @people = User.where(is_public: true)
  end
end
