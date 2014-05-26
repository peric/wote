class VotesController < ApplicationController
  def index
    @random_website = get_random_website(current_user())
    @success = params[:success]
    @website_path = nil

    if @random_website
      if @random_website.screenshot.nil?
        website_url    = @random_website.url
        directory_path = 'images/'
        @website_path  = directory_path + @random_website.url.gsub('http://www', '').gsub(/(\W|\d)/, "") + '.png'

        ws = Webshot::Screenshot.instance

        ws.capture website_url, 'public/' + @website_path, width: 1000, height: 1000, quality: 95

        @random_website.screenshot = @website_path
        @random_website.save!
      else
        @website_path = @random_website.screenshot
      end
    end


    # TODO: User settings
    # TODO: Keep showing pages forever, but put them somewhere after they reach 10 votes - export them somewhere or put them to other table
  end

  def upvote
    @website = Website.find(params[:website_id])

    @vote = Vote.new(vote_params)
    @vote.website = @website
    @vote.user = current_user()
    @vote.upvote = true

    respond_to do |format|
      begin
        @vote.save!
        format.html { redirect_to action: 'index', :status => :found, :success => 'true' }
      rescue ActiveRecord::RecordNotUnique
        format.html { redirect_to action: 'index', :status => :found, :success => 'false' }
      end
    end
  end

  def downvote
    @website = Website.find(params[:website_id])

    @vote = Vote.new(vote_params)
    @vote.website = @website
    @vote.user = current_user()
    @vote.upvote = false

    respond_to do |format|
      begin
        @vote.save!
        format.html { redirect_to action: 'index', :status => :found, :success => 'true' }
      rescue ActiveRecord::RecordNotUnique
        format.html { redirect_to action: 'index', :status => :found, :success => 'false' }
      end
    end
  end

  def why

  end

  private
  def is_website_already_voted(user, website)
    already_voted = false

    if Vote.where(user: user, website: website).count > 0
      already_voted = true
    end

    already_voted
  end

  def get_random_website(user)
    @random_website = nil

    if user
      websites = Website.where("websites.id NOT IN (SELECT website_id FROM Votes WHERE user_id=#{user.id})")

      if websites.count() > 0
        @random_website = websites.first
        # TODO: shuffle maybe
      end
    end

  end
end