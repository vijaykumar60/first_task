module CompanyRatingsConcern
    extend ActiveSupport::Concern

    COMPANY_RATING_COLUMN_MAPPING = {
        "rating" => "Rating",
        "rating_action" => "Rating Action",
        "rating_group" => "Rating Group",
        "outlook" => "Outlook",
    } 

    COMPANY_RATING_JSON_HEADER = "rating_history"
    COMPANY_RATING_FILENAME = "input2"
end