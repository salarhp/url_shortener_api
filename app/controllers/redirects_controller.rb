class RedirectsController < ApplicationController
  def show
    debugger
    link = Link.find_by!(slug: params[:slug], status: :active)
    link.increment!(:click_count)
    redirect_to link.original_url, allow_other_host: true
  rescue ActiveRecord::RecordNotFound
    render plain: 'Link not found', status: :not_found
  end
end
