class GithubFetcher

  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["GITHUB_SECRET_KEY"])
    @user = @client.user
    @user.login
  end

  def find_repos
    repos = []
    @client.repos.each do |repo|
      repos << repo[:full_name]
    end
    return repos
  end

  def find_recent(repos)
    time = Commit.last.created_at
    repos.each do |x|
      if @client.commits(x).first[:commit][:committer][:date] > time
        time = @client.commits(x).first[:commit][:committer][:date]
        Commit.create(commit_message: @client.commits(x).first[:commit][:message])
        @twit = TweetFetcher.new
        @twit.tweet
      end
    end
    return time
  end
end
