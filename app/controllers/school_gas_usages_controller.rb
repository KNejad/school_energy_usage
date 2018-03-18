class SchoolGasUsagesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render  json: SchoolGasUsage.all }
    end
  end
end
