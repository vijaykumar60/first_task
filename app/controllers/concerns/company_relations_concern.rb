module CompanyRelationsConcern
    extend ActiveSupport::Concern

    COMPANY_RELATION_COLUMN_MAPPING = {
        "company_name" => "Compnay Name",
        "company_cin" => "CIN",
        "relation_name" => "Relation Entity",
        "stake_percent" => "% Stake",
        "company_mca_status" => "MCA Status",
        "nature_of_business" => "Nature Of Business"
    }   

    COMPANY_RELATION_JSON_HEADER = "company_relationships"
    COMPANY_RELATION_FILENAME = "input"
end