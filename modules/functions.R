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

