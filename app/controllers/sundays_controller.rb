class SundaysController < ApplicationController
  def index
    sundays = SundayResource.all(params)
    respond_with(sundays)
  end

  def show
    sunday = SundayResource.find(params)
    respond_with(sunday)
  end

  def create
    sunday = SundayResource.build(params)

    if sunday.save
      render jsonapi: sunday, status: 201
    else
      render jsonapi_errors: sunday
    end
  end

  def update
    sunday = SundayResource.find(params)

    if sunday.update_attributes
      render jsonapi: sunday
    else
      render jsonapi_errors: sunday
    end
  end

  def destroy
    sunday = SundayResource.find(params)

    if sunday.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sunday
    end
  end
end
