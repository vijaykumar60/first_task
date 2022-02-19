class CompanyRelationsController < ApplicationController

  include TreeModelConcern
  include CompanyRelationsConcern

  def company_relations
    response = convert_in_trees(COMPANY_RELATION_COLUMN_MAPPING, COMPANY_RELATION_FILENAME, COMPANY_RELATION_JSON_HEADER)
    msg = {:status => "ok", :data => response}
    render :json => response
  end
  
  
end
