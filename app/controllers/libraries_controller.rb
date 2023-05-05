class LibrariesController < ApplicationController
  before_action :set_library, only: %i[ show edit update destroy ]

  # GET /libraries or /libraries.json
  def index

    @up = false
    @up_genre = false

    @libraries = @libraries.order(:name) if params[:sort] == "name"
    if params[:sort] == "book_count"
      @libraries = @libraries.sort_by { |library| library.books.count}
      @up = true
    end

    if params[:sort] == "genre_count"
      @libraries = @libraries.sort_by { |library| library.books.select(:genre_id).distinct.count }
      @up_genre = false
    end

    if params[:sort] == "genre_count_desc"
      @libraries = @libraries.sort_by { |library| library.books.select(:genre_id).distinct.count }.reverse
      @up_genre = true
    end

    @libraries = Library.page(params[:page] || 1).per(5)
  end

  # GET /libraries/1 or /libraries/1.json
  def show
  end

  # GET /libraries/new
  def new
    @library = Library.new
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries or /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to library_url(@library), notice: "Library was successfully created." }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1 or /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to library_url(@library), notice: "Library was successfully updated." }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1 or /libraries/1.json
  def destroy
    @library.destroy

    respond_to do |format|
      format.html { redirect_to libraries_url, notice: "Library was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:name, :location)
    end
end
