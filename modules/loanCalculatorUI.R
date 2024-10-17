list(
        div(class = "loan-calculator-container", h2("Loan Calculator")),
        br(),
        fluidRow(
        box(
          title = tags$h3("Parameters", style="font-size: 20px;"), status = "primary", solidHeader = T,
          numericInputIcon(inputId = "loan_inital_balance", label = "Loan Amount:", value = 500000, step = 5000, icon = "KES"),
          numericInputIcon(inputId = "loan_interest", label = "Interest Rate:", value = 5, icon = list(NULL, icon("percent"))),
          numericInputIcon(inputId = "loan_years", label = "Term of Loan (in Years):", value = 25, icon = list(NULL, "Years")),
          selectInput("loan_freq", "Frequency of Repayments:", freq_list),
          hr(),
          h4(strong("Periodic Repayment Amount:")),
          h3(textOutput("loan_periodic_repay")),
          width = 4,
          style = "height:480px", minimizable = FALSE
        ),
        box(width = 8, title = tags$h3("Loan Schedule", style="font-size: 20px;"), status = "primary", minimizable = FALSE, solidHeader = T, DT::dataTableOutput("loan_schedule"), style = "height:480px")
        ),
        br(),
        fluidRow(
        box(title = tags$h3("Loan Balance Outstanding Over Time", style="font-size: 20px;"), width = 6, minimizable = FALSE, status = "primary", solidHeader = T, height = "500px", style = "margin-top:1em; margin-right:3em", plotOutput("loan_plot_balance")),
        box(title = tags$h3("Interest vs Capital Proportions per Repayment", style="font-size: 20px;"), width = 6, minimizable = FALSE, status = "primary", solidHeader = T, height = "500px", style = "margin-top:1em; margin-right:3em; ", plotOutput("loan_plot_interest_vs_capital"))
        )
)  


