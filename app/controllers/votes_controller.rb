class VotesController < ApplicationController
  def index
    # TODO: this stops when 3000 votes is collected

    @user = current_user()
    user_votes = Vote.where(:user => @user)
    @all_votes_count = Vote.all.count

    if user_votes.count > 0 || params[:understand]
      @random_website = get_random_website(@user)
      @success = params[:success]

      if @random_website
        screenshot = 'http://dl.dropboxusercontent.com/u/2425826/wote/images/' + @random_website.url.gsub('http://www', '').gsub(/(\W|\d)/, '') + '.png'

        unless @random_website.screenshot == screenshot
          @random_website.screenshot = 'http://dl.dropboxusercontent.com/u/2425826/wote/images/' + @random_website.url.gsub('http://www', '').gsub(/(\W|\d)/, '') + '.png'
          @random_website.save!
        end
      end
    else
      if @user
        # renders faq just when user is logged in
        @show_next = true
        render :template => "votes/faq"
      else
        return
      end
    end
  end

  def upvote
    @website = Website.find(params[:website_id])

    @vote = Vote.new(vote_params)
    @vote.website = @website
    @vote.user = current_user()
    @vote.upvote = true

    # TODO: make something in case screenshot fails

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

  #def generate_all
  #  websites = Website.all
  #
  #  websites.each do |website|
  #    begin
  #      website_url = website.url
  #      directory_path = 'images/'
  #      website_path  = directory_path + website_url.gsub('http://www', '').gsub(/(\W|\d)/, "") + '.png'
  #
  #      unless File.exist?('public/' + website_path)
  #        ws = Webshot::Screenshot.instance
  #
  #        ws.capture website_url, 'public/' + website_path, width: 1000, height: 1000, quality: 95
  #      end
  #    rescue Exception => ex
  #      next
  #    end
  #  end
  #end

  def faq

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
        @random_website = websites.shuffle.first
      end
    end

  end
end