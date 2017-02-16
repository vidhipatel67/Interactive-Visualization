# Interactive-Social-Visualization
Explore the provided StackOverflow searching log data.​ Design an interactive social visualization web application to explore and discover facts and patterns.

## Data Set:

#### class_query.csv 
​ (logs user’s queries)  intention {KS: knowledge seeking, PS: problem solving, ML: method  learning, NA: others}  query (query terms)    
#### class_operation.csv 
​ (logs user’s operations)  timestamp  operation {target_clicked, scroll_down, scroll_up, select}  url  u_id    
#### class_select.csv  
​ (logs user’s interest after query: reading behavior)  operation (select)  url (same as class_operation.csv operation=’select’)  text (highlighted text)    
#### class_click.csv  
​ (logs user’s interest after query: reading content)  operation (target_clicked)  url(same as class_operation.csv operation=’target_clicked’)  target (url of the selected article after query)  text(content text of the selected article after query