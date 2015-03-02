class ProfileController < ApplicationController
  def repositories
    profile_url = "https://api.github.com/users/Topstitch/repos"
    @profile = HTTParty.get(profile_url,
            :headers => {
              "Authorization" => "token #{ENV['GITHUB_TOKEN']}",
              "User-Agent" => "Topstitch"})
  end

  def avatar
  end
end
