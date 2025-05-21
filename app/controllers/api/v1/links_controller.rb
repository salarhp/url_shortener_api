class Api::V1::LinksController < ApplicationController
  def index
    render json: Link.order(created_at: :desc).limit(100)
  end

  def show
    render json: Link.find(params[:id])
  end

  def create
    link = Link.new(link_params.merge(user: current_user))
    if link.save
      render json: link, status: :created
    else
      render json: { errors: link.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def current_user
    User.first_or_create!(email: 'demo@example.com') # mocked
  end
end
