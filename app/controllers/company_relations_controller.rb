class CompanyRelationsController < ApplicationController

  include CompanyRelationsConcern

  def show
    response = convert_in_trees
    msg = {:status => "ok", :data => response}
    render :json => msg

  end
    
end
