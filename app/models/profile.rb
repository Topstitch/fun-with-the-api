class Profile
  def initialize
    repo_url = "https://api.github.com/users/Topstitch/repos"
    @repo_data = self.party_time(repo_url)

    profile_url = "https://api.github.com/users/Topstitch"
    @profile_data = self.party_time(profile_url)

    starred_url = "https://api.github.com/users/Topstitch/starred"
    @starred_data = self.party_time(starred_url)

    #unlike the others, this one only works with an authenticated call...can't view it in the browser
    organization_url = "https://api.github.com/users/Topstitch/orgs"
    @organization_data = self.party_time(organization_url)
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
    DateTime.parse(@profile_data["created_at"]).strftime('Joined on %b %d, %Y')
  end

  def followers
    @profile_data["followers"]
  end

  # for whatever reason, they don't have "starred" on the profile api page
  def starred
    @starred_data.length
  end


  def following
    @profile_data["following"]
  end

  def organizations
    organizations_array = []
    @organization_data.each do |org|
      organizations_array << org["avatar_url"]
    end
    organizations_array
  end

  # I feel like there should be a less complicated way to do this, perhaps without breaking things into arrays, but I don't know what it is
  def repository_names
    repository_names_array = []
    @repo_data.each do |repo|
      repository_names_array << repo["name"]
    end
    repository_names_array
  end


end
