class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]
  skip_before_action :authenticate_request, only: %i[index show]

  def index
    @projects = Project.all
    render json: @projects.to_json(include: { attachments: { only: :file }, preview_image: { only: :file } })
  end

  def show
    render json: @project.to_json(include: %i[attachments preview_image])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :ok
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title,
                                    :description,
                                    :client_name,
                                    :start_date,
                                    extras: {},
                                    attachments_attributes:
                                      [
                                        :remote_file_url,
                                        :file_base64,
                                        :file_name,
                                        file: [:url]
                                      ],
                                    preview_image_attributes: [
                                      :remote_file_url,
                                      :file_base64,
                                      :file_name,
                                      file: [:url]
                                    ])
  end
end
