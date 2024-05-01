class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    current_user = User.find(session[:user_id])

    if @course.user != current_user
      flash[:alert] = "No Permission"

      redirect_to course_path(@course)
      return
    end
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    current_user = User.find(session[:user_id])

    if @course.user != current_user
      flash[:alert] = "No Permission"

      redirect_to course_path(@course)
      return
    end

    if @course.update(course_params)
      redirect_to @course, notice: "Course was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy!
    redirect_to courses_url, notice: "Course was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :body, :summary)
    end
end
