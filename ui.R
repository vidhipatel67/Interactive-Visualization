library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h2("Assignment#1:Interactive Social Visualization/Web Application")),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  h3("Interactive plots of 2 users to compare specific interests over a period of 1 month(Social Interaction)"),
  h5("Interaction:Please use the tabs to navigate plots between the 3 users. Select points or drag over an area that you want to exclude from the plot."),
      tabsetPanel(type = "tabs", 
                  tabPanel("Novice User",h5("Novice user(A0046) who just signed up for the website and searches queries related to MIPS"), plotOutput("plot1", height = 350,
                                                click = "plot1_click",
                                                brush = brushOpts(
                                                  id = "plot1_brush"
                                                )),
                  actionButton("exclude_toggle1", "Toggle points"),
                  actionButton("exclude_reset1", "Reset")), 
                  tabPanel("Advanced User",h5("Advanced user(A0066) who searches queries related to IDE and testing"),  plotOutput("plot2", height = 350,
                                                 click = "plot2_click",
                                                 brush = brushOpts(
                                                   id = "plot2_brush"
                                                 )),
                           actionButton("exclude_toggle2", "Toggle points"),
                           actionButton("exclude_reset2", "Reset")), 
                  tabPanel("Advanced User",h5("Advanced user(A0066) who searches queries related to Java"),  plotOutput("plot3", height = 350,
                                                 click = "plot3_click",
                                                 brush = brushOpts(
                                                   id = "plot3_brush"
                                                 )),
                           actionButton("exclude_toggle3", "Toggle points"),
                           actionButton("exclude_reset3", "Reset"))
  ),
      #div("EXPLANATION"),
  h3("How was the data modified"),
  h5("Two users with different levels of knowledge were identified by plotting a graph between the users and their unique URL visits from the dataset class_operation. The data was collected in terms of count of unique timestamp count of and unique URL for 1 month for that user. User ID A0046 was a novice user and his URL contained terms related to MIPS programming. His URL also indicated that he signed up for the website in between the time period. User ID A0066 was an advanced user who searched for IDE,testing and Java related topics. The plots of user A0066 are given in 2 different tabs to compare topic related searches between the 2 users."),
  
  h3("Findings and Pattern Analysis"),
  HTML("<ul><li>For user 1, his activity on the wesbite started with very basic queries such as a student learning for to code. After user signup the frequency of visiting the website has increased which is indicated by the number of increased points near the second half of the plot. For user 2 who is advanced in his knowledge about coding than user 1 which is indicated by the type of queries he makes, the number of queries increases as time progresses. In both the scenarios, the number of queries made increased which shows that user visit to the website increased over time.</li>
<li> For user searching for Java related knowledge, the number of unique URLs hit increased over time alongwith the number of visits. Whereas user searching for MIPS related knowledge decreased his number of frequent URL visits over time. This indicates that as user knowledge increases, the frequency of queries increased. Which can be expected to increase since the complexity of the programming language requires user to search more to understand the domain. There is a direct relation between increase in user knowledge and amount of additional information needed in order to solve complex situations.</li></ul>
       <br><h4>CONCLUSION:</h4><h5><i><ul><li>There is a direct relation between increase in user knowledge and amount of additional information needed in order to solve complex situations.</li><li>User visits to the site increases as the complexity of the knowledge required increased.</li><li>User visits increased over time as they got more familiar with the website and found relevant information.</li></ul></i></h5><hr>"),
  
  #HEATMAP
  h3("Heatmap for frequency of maximum occuring query words for each intention"),
  plotOutput("plot4", height = "800px"),  
  HTML("<h3>Heatmap</h3>
         
         <h5>This heatmap shows the frequency of the maximum occuring keywords in the query list dataset and how each of them map to the intention identified in the dataset.</h5>
         
         <h3>How the data was modified</h3>
         <h5>For each query term, the frequently occuring words were identified by a Python script and counted each occurence with each intention and mapped as separate dataset.</h5>
         
         <h3>Findings and Pattern Analysis</h3>
         <ul>
         <li> The terms Java, array, sorting were most frequent under 'Knowledge Seeking' intention which showed that Java users who come to stackoverflow increase their knowledge by searching for them. </li>
         <li> The terms parse, string, sort were most frequently searched by users looking for Problem solving questions. </li>
         <li> The terms number,array, java were also most freuquent under the intention of 'Method Learning' which showed that users learning Java were searching queries prominent under both the intentions. </li>
         <li>The terms why,how,what were included in the analysis to find out how user searched of the text. It was found that users with intention of 'Knowledge Seeking' frequently searched by starting with 'why' and 'what'. On the other hand, users most frequently used the term 'how' in order to look for results related to 'method learning' intention.</li></ul>
<br><h4>CONCLUSION:</h4><h5><i><ul><li>'Java' was most frequently searched by users with the intention of 'Knowledge Seeking';'Array' was most frequently searched by users with the intention of 'Problem Solving';'Array' was most searched by intention of 'Method Learning'.</li><li> Similarly, 'when','why' terms were identified with the intention of 'knowledge seeking' and 'how' was identified with the intention of 'method learning'. These can be used to predict the nature of intention from the queries.</li></ul></i></h5><hr><br><br>")
  
  
  #sidebarLayout(position = "right",sidebarPanel(div("Analysis of ..."),div("Explanation")),mainPanel(plotOutput("plot4", height = "800px")))
  
))