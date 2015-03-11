class WelcomeController < ApplicationController

  def home
    @gh = GithubFetcher.new
    @repos = @gh.find_repos
    @time = @gh.find_recent(@repos)
  end
end
