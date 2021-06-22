# frozen_string_literal: true

class DiariesController < ApplicationController
  before_action :set_diary, only: %i[show edit update destroy]

  # GET /diaries or /diaries.json
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1 or /diaries/1.json
  def show; end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit; end

  # POST /diaries or /diaries.json
  def create
    @diary = Diary.new(diary_params)

    if @diary.save
      redirect_to @diary, notice: 'Diary was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    if @diary.update(diary_params)
      redirect_to @diary, notice: 'Diary was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy
    redirect_to diaries_url, notice: 'Diary was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diary
    @diary = Diary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def diary_params
    params.require(:diary).permit(:high_light)
  end
end
