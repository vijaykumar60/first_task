module TreeModelConcern
    extend ActiveSupport::Concern


    class TreeNode
  
      attr_reader :type, :data
  
      def initialize(type, isLeafNode=false, data="")
        if isLeafNode 
            @data = data
        else
            @data = []
        end
        @type = type
      end
  
      def add_child(child)
        @data << child
      end
  
    end

    def convert_in_trees(column_mapping, file_name, json_header)
        begin 
            final_ans = TreeNode.new("table")
            table_head = get_table_head(column_mapping)
            final_ans.add_child(table_head)
            table_body = get_table_body(column_mapping, file_name, json_header)
            final_ans.add_child(table_body)
            puts final_ans
            return final_ans

        rescue Exception => e
            return "Something went wrong!"
        end
    end

    private 
        def get_table_head(column_mapping)
            head_node = TreeNode.new("thead")
            tr_node = TreeNode.new("tr")
            column_mapping.each do |key, value|
                td_node = TreeNode.new("td")
                leaf_node = TreeNode.new("text", true, value)
                td_node.add_child(leaf_node)
                tr_node.add_child(td_node)
            end
            head_node.add_child(tr_node)
            return head_node
        end

        def get_table_body(column_mapping, file_name, json_header)
            begin 
                file_path = "/Users/vijay.kumar/credavenue/first_task/config/"+file_name+".json"
                input_file = File.open file_path
                input_json_data = JSON.load input_file

                body_node = TreeNode.new("tbody")
                input_json_data[json_header].each do |item|
                    tr_node = TreeNode.new("tr")
                    column_mapping.each do |key, value|
                        item_value = "NA"
                        if item.key?(key)
                        if item[key].nil? == false 
                            item_value = item[key]
                            if item_value.class == String && item_value.length == 0
                            item_value = "NA"
                            end
                        end
                        end
                        td_node = TreeNode.new("td")
                        leaf_node = TreeNode.new("text", true, item_value)
                        td_node.add_child(leaf_node)
                        tr_node.add_child(td_node)
                    end
                    body_node.add_child(tr_node)
                end
                return body_node
            rescue
                return "Something went wrong while getting the data from file!!"
            end
        end


end