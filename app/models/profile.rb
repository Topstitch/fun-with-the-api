class Profile
  def initialize
    profile_url = "https://api.github.com/users/Topstitch/repos"
    @data = HTTParty.get(profile_url,
            :headers => {
              "Authorization" => "token #{ENV['GITHUB_TOKEN']}",
              "User-Agent" => "Topstitch"})
  end

  def profile_picture
    @data
  end

end
