class CompanyRelationsController < ApplicationController

  include TreeModelConcern
  include CompanyRelationsConcern

  def show
    response = convert_in_trees(JSON_TO_COLUMN_HEADER_MAPPING)
    msg = {:status => "ok", :data => response}
    render :json => response
  end
  
  def company_rating

  end
end
