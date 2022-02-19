class CompanyRatingsController < ApplicationController

    include TreeModelConcern
    include CompanyRatingsConcern
    
    def company_ratings
        response = convert_in_trees(COMPANY_RATING_COLUMN_MAPPING, COMPANY_RATING_FILENAME, COMPANY_RATING_JSON_HEADER)
        msg = {:status => "ok", :data => response}
        render :json => response
      end
end