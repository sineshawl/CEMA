library(tidyverse)
library(deSolve)

# Define the model equation

vector_human <- function(t, x, params){
  with(as.list(c(params, x)), {
    
    # Total population
    M = Sm + Im
    H = S + I
    
    # Vector Equation
    dSm = mu_m*M - beta*I/H*Sm - mu_m*Sm
    dIm =  beta*I/H*Sm - mu_m*Im
    
    # Human Equations
    dS = -alpha*Im/H*S + gamma*I
    dI= alpha*Im/H*S - gamma*I
    
    output <- c(dSm, dIm, dS, dI)
    list(output)
    
    
    
    
  })
}

# The initial population in the compartments 
start <- c(Sm = 40000,
           Im = 3000,
           S = 5000,
           I = 1000)

# Define the parameters to be used

params <- c(mu_m = 1/15,
            alpha = 0.12,
            beta = 0.25,
            gamma = 1/20)

# The time interval
times <- seq(0, 365)


