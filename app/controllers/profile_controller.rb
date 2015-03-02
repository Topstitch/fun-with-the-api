class ProfileController < ApplicationController
  def repositories
    @profile = Profile.new
  end

end
