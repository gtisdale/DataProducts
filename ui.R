shinyUI(pageWithSidebar(
  headerPanel("S&P 500 Return Statistics"),
  sidebarPanel(
    dateInput("StartDate", "Start Date:",value="1990-01-01"),
    dateInput("EndDate","End Date:",value="2000-01-01"),
    sliderInput("bins","Number of bins:",min=10,max=50,step=20, value=30)
  ),
  mainPanel(
     h4('Daily Return Mean (Percentage)'),
     verbatimTextOutput("out.mean"),
     h4('Daily Return Standard Deviation (Percentage)'),
     verbatimTextOutput("out.sd"),
     plotOutput("dispPlot"),
     h5('Documentation:'),
     h5('This application computes return statistics for the S&P index for dates between'),
     h5('1950-01-03 and 2015-01-22.'),
     h5('The required inputs are a starting date and an ending date, which must be entered'),
     h5('in the appropriately marked boxes on the left side of the screen.  The date format'),
     h5('can be entered as text in the format YYYY-MM-DD or using the calendar widgets.'),
     h5('  '),
     h5('The outputs are a mean and standard deviation of the daily percentage change of the'),
     h5('included dates.  The histogram gives a graphic for the percentage daily changes in'),
     h5('the index.  The slider can be used to change the histogram from 10 to 30 to 50 bins,'),
     h5('which allows coarse-medium-fine resolution for the histogram.')
  )  
))