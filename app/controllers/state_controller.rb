class StateController < ApplicationController

  def index
    @states = State.all
    render json: @state
  end

  def show
    @state = State.find(params[:id])
    render json: @state
  end

end