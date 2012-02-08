class TagController < ApplicationController

# GET /tags
  # GET /tags.xml
  def index
    search_term = params[:q]

    if search_term.blank?
      teaching_interests = User.teaching_interest_counts.order("name ASC")
      learning_interests = User.learning_interest_counts.order("name ASC")
    else
      teaching_interests = User.teaching_interest_counts.where(
        "name like ? OR name like ?", "%#{search_term.capitalize}%", "%#{search_term.upcase}%") 
      learning_interests = User.learning_interest_counts.where(
        "name like ? OR name like ?", "%#{search_term.capitalize}%", "%#{search_term.upcase}%") 
    end

    @tags = teaching_interests | learning_interests
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => learning_interests }
    end
  end

end
