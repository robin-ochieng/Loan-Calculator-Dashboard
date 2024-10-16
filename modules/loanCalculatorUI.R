list(
        div(class = "loan-calculator-container", h2("Loan Calculator")),
        br(),
        fluidRow(
        box(
          title = "Parameters", status = "white", solidHeader = T,
          numericInputIcon(inputId = "loan_inital_balance", label = "Loan Amount:", value = 500000, step = 5000, icon = "KES"),
          numericInputIcon(inputId = "loan_interest", label = "Interest Rate:", value = 5, icon = list(NULL, icon("percent"))),
          numericInputIcon(inputId = "loan_years", label = "Term of Loan (in Years):", value = 25, icon = list(NULL, "Years")),
          selectInput("loan_freq", "Frequency of Repayments:", freq_list),
          hr(),
          h4(strong("Periodic Repayment Amount:")),
          h3(textOutput("loan_periodic_repay")),
          width = 6,
          style = "height:480px"
        ),
        
        box(width = 6, title = "Loan Schedule", status = "white", solidHeader = T, DT::dataTableOutput("loan_schedule"), style = "height:480px")
        ),
        fluidRow(
        box(title = "Loan Balance Outstanding Over Time", width = 6, status = "white", solidHeader = T, height = "500px", style = "margin-top:1em; margin-right:3em", plotOutput("loan_plot_balance")),
        box(title = "Interest vs Capital Proportions per Repayment", width = 6, status = "white", solidHeader = T, height = "500px", style = "margin-top:1em; margin-right:3em", plotOutput("loan_plot_interest_vs_capital"))
        )
)  