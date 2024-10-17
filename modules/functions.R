# Loan Calculator Functions -----------------------------------------------
  loan_summary <- function(inital_balance, interest_rate, term_years, freq_repay){
    interest_rate = interest_rate / 100
    
    p = p_list[match(freq_repay, freq_list)]
    ip_p = effective2Convertible(interest_rate, k = p)/p
    
    total_payments = term_years * p
    repay = inital_balance / annuity(i = interest_rate, n = term_years, k = p) / p
    
    repay_no = seq(0, total_payments)
    repay_vect = c(0, rep(repay, total_payments)) 
    
    balance = numeric(total_payments + 1)
    int_paid = numeric(total_payments + 1)
    cap_paid = numeric(total_payments + 1)
    int_percent = numeric(total_payments + 1)
    cap_percent = numeric(total_payments + 1)
    
    balance[1] = inital_balance
    
    for(i in (1:(total_payments))){
      int_paid[i + 1] = ip_p * balance[i]
      cap_paid[i + 1] =  repay - int_paid[i + 1]
      balance[i + 1] = balance[i] - cap_paid[i + 1]
      int_percent[i + 1] = (int_paid[i + 1]) / repay 
      cap_percent[i + 1] = (cap_paid[i + 1]) / repay 
    }
    
    loan_summary <- data.frame(repay_no, balance, int_percent, cap_percent, int_paid, cap_paid, repay_vect)
    return(loan_summary)
  }



custom_ggplot_theme <- function() {
  theme(
    legend.position = "top",
    legend.title = element_text(color = "#E1E1E1", size = 12),  # Color and size of the legend title
    legend.text = element_text(color = "#E1E1E1", size = 11),   # Color and size of the legend text
    legend.background = element_rect(fill = "#333333", color = NA),  # Background color of the legend
    legend.key = element_rect(fill = "#202123", color = "#333333"),  # Background of the keys in the legend
    axis.text.x = element_text(size = 10, color = "#E1E1E1"),
    axis.text.y = element_text(size = 10, color = "#E1E1E1"),
    axis.title.x = element_text(margin = margin(t = 15, r = 0, b = 0, l = 0), color = "#E1E1E1"),
    axis.title.y = element_text(margin = margin(t = 0, r = 15, b = 0, l = 0), color = "#E1E1E1"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "#202123", color = "#333333"),
    axis.line = element_line(colour = "#ffffff"),
    plot.background = element_rect(fill = "#202123", color = NA),
    plot.title = element_text(color = "#E1E1E1", hjust = 0.5),
    plot.subtitle = element_text(color = "#E1E1E1", hjust = 0.5),
    plot.caption = element_text(color = "#E1E1E1")
  )
}