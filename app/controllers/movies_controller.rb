class MoviesController < ApplicationController
  def index
    @movies = Movie.page(params[:page])

    render("movies/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
    @character = Character.new
    @movie = Movie.find(params[:id])

    render("movies/show.html.erb")
  end

  def new
    @movie = Movie.new

    render("movies/new.html.erb")
  end

  def create
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to(:back, :notice => "Movie created successfully.")
    else
      render("movies/new.html.erb")
    end
  end

  def edit
    @movie = Movie.find(params[:id])

    render("movies/edit.html.erb")
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to(:back, :notice => "Movie updated successfully.")
    else
      render("movies/edit.html.erb")
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    if URI(request.referer).path == "/movies/#{@movie.id}"
      redirect_to("/", :notice => "Movie deleted.")
    else
      redirect_to(:back, :notice => "Movie deleted.")
    end
  end
end
