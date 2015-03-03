class Profile
  def initialize
    repo_url = "https://api.github.com/users/Topstitch/repos"
    @repo_data = self.party_time(repo_url)

    profile_url = "https://api.github.com/users/Topstitch"
    @profile_data = self.party_time(profile_url)
  end

  def party_time(url)
    HTTParty.get(url,
            :headers => {
              "Authorization" => "token #{ENV['GITHUB_TOKEN']}",
              "User-Agent" => "Topstitch"})
  end

  def profile_picture
    @profile_data["avatar_url"]
  end

  def username
    @profile_data["login"]
  end

  def joined_on
    DateTime.parse(@profile_data["created_at"]).strftime('%b %d, %Y')
  end

end
