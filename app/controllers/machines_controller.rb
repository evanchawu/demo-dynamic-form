class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]

  def index
    @machines = Machine.all
  end

  def show
  end

  def new
    @machine = Machine.new
  end

  def edit
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to @machine, notice: 'Machine was successfully created.'
    else
      render :new
    end
  end

  def update
    if @machine.update(machine_params)
      redirect_to machines_path, notice: 'Machine was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @machine.destroy
    redirect_to machines_url, notice: 'Machine was successfully destroyed.'
  end

  private
    def set_machine
      @machine = Machine.find(params[:id])
    end

    def machine_params
      safe_attributes = [
        :name,
        parts_attributes: [
          :name,
          :_destroy
        ]
      ]
      params.require(:machine).permit(safe_attributes)
    end
end
