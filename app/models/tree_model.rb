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
      
      def convert_in_trees
          final_ans = TreeNode.new("table")
          table_head = get_table_head
          final_ans.add_child(table_head)
          table_body = get_table_body
          final_ans.add_child(table_body)
          puts final_ans
          return final_ans
      end
  
      private 
          def get_table_head 
              head_hash = TreeNode.new("thead")
              tr_hash = TreeNode.new("tr")
              JSON_TO_COLUMN_HEADER_MAPPING.each do |key, value|
                  td_hash = TreeNode.new("td")
                  leaf_node = TreeNode.new("text", true, value)
                  td_hash.add_child(leaf_node)
                  tr_hash.add_child(td_hash)
              end
              head_hash.add_child(tr_hash)
              return head_hash
          end
  
          def get_table_body
              input_file = File.open "/Users/vijay.kumar/credavenue/first_task/config/input.json"
              input_json_data = JSON.load input_file
  
              body_hash = TreeNode.new("tbody")
              input_json_data["company_relationships"].each do |item|
                  tr_hash = TreeNode.new("tr")
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
                      td_hash = TreeNode.new("td")
                      leaf_node = TreeNode.new("text", true, item_value)
                      td_hash.add_child(leaf_node)
                      tr_hash.add_child(td_hash)
                  end
                  body_hash.add_child(tr_hash)
              end
              return body_hash
          end
end
