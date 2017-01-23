class LoveStoriesController < ApplicationController

  def show
    love_story = LoveStory.find_by_token params[:token]
    return head :not_found unless love_story
    filename = love_story.image.path
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end

  def thumb
    love_story = LoveStory.find_by_token params[:token]
    filename = love_story.image.send(params[:version].to_sym).path
    send_file filename, type: 'image/jpeg', disposition: 'inline'
  end

end