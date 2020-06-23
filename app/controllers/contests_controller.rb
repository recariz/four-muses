class ContestsController < ApplicationController

  def index
    @contests = policy_scope(Contest)
  end

end
