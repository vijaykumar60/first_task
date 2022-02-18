module CompanyRelationsConcern
    extend ActiveSupport::Concern

    JSON_TO_COLUMN_HEADER_MAPPING = {
        "company_name" => "Compnay Name",
        "company_cin" => "CIN",
        "relation_name" => "Relation Entity",
        "stake_percent" => "% Stake",
        "company_mca_status" => "MCA Status",
        "nature_of_business" => "Nature Of Business"
    }


    def convert_in_trees
        final_ans = [{"type" => 'table', "data" => []}]
        table_head = get_table_head
        final_ans[0]["data"].push(table_head)
        table_body = get_table_body
        final_ans[0]["data"].push(table_body)
        puts final_ans
        return final_ans
    end

    private 
        def get_table_head 
            head_hash = {"type" => "thead", "data" => []}
            tr_hash = {"type"=> "tr" , "data" => []}
            JSON_TO_COLUMN_HEADER_MAPPING.each do |key, value|
                td_hash = {"type" => "td" , "data" => []}
                td_hash["data"] = [{"type" => "text", "data" => value}]
                tr_hash["data"].push(td_hash)        
            end
            head_hash["data"].push(tr_hash)
            return head_hash
        end

        def get_table_body
            input_file = File.open "/Users/vijay.kumar/credavenue/first_task/config/input.json"
            input_json_data = JSON.load input_file

            body_hash = {"type" => "tbody", "data" => []}
            input_json_data["company_relationships"].each do |item|
                tr_hash = {"type"=> "tr" , "data" => []}
                JSON_TO_COLUMN_HEADER_MAPPING.each do |key, value|
                    item_value = "NA"
                    if item.key?(key)
                    if item[key].nil? == false 
                        item_value = item[key]
                        if item_value.class == String && item_value.length == 0
                        item_value = "NA"
                        end
                    end
                    end
                    td_hash = {"type" => "td" , "data" => []}
                    td_hash["data"] = {"type" => "text" , "data" => item_value}
                    tr_hash["data"].push(td_hash)
                end
                body_hash["data"].push(tr_hash)
            end
            return body_hash
        end
end