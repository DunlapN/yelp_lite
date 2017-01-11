class ReviewPhotosController < ApplicationController
  def index
    @q = ReviewPhoto.ransack(params[:q])
    @review_photos = @q.result(:distinct => true).includes(:review).page(params[:page]).per(10)

    render("review_photos/index.html.erb")
  end

  def show
    @review_photo = ReviewPhoto.find(params[:id])

    render("review_photos/show.html.erb")
  end

  def new
    @review_photo = ReviewPhoto.new

    render("review_photos/new.html.erb")
  end

  def create
    @review_photo = ReviewPhoto.new

    @review_photo.review_id = params[:review_id]

    save_status = @review_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_photos/new", "/create_review_photo"
        redirect_to("/review_photos")
      else
        redirect_back(:fallback_location => "/", :notice => "Review photo created successfully.")
      end
    else
      render("review_photos/new.html.erb")
    end
  end

  def edit
    @review_photo = ReviewPhoto.find(params[:id])

    render("review_photos/edit.html.erb")
  end

  def update
    @review_photo = ReviewPhoto.find(params[:id])

    @review_photo.review_id = params[:review_id]

    save_status = @review_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_photos/#{@review_photo.id}/edit", "/update_review_photo"
        redirect_to("/review_photos/#{@review_photo.id}", :notice => "Review photo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review photo updated successfully.")
      end
    else
      render("review_photos/edit.html.erb")
    end
  end

  def destroy
    @review_photo = ReviewPhoto.find(params[:id])

    @review_photo.destroy

    if URI(request.referer).path == "/review_photos/#{@review_photo.id}"
      redirect_to("/", :notice => "Review photo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review photo deleted.")
    end
  end
end
