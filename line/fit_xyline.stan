data {

  int<lower=0> N; // number of data points
  vector[N] x_obs; // x observations
  vector[N] y_obs; // y observations  
  real<lower=0> sigma_x; // homoskedastic measurement error
  real<lower=0> sigma_y; // homoskedastic measurement error

  int<lower=0> N_model; // number of data points for line
  vector[N_model] x_model;

}

parameters {
  
  real slope; //slope of the line
  real intercept; //intercept of the line
  vector[N] x_latent;
}

transformed parameters {
    
  // latent y values not obscured by measurement error
    vector[N] y_latent = slope * x_latent + intercept;

}

model {

  // weakly informative priors

  // latent x_distribution
  
  // soft tail prior in the range of the data
  x_latent ~ normal(10,10);
  
  slope ~ normal(0,5);
  intercept ~ normal(0,5);

  
  // likelihood

  y_obs ~ normal(y_latent,  sigma_y);
  x_obs ~ normal(x_latent, sigma_x);

  

}

generated quantities {

  vector[N] ppc_X;
  vector[N] ppc_y;
  vector[N_model] line;

  // generate the posterior of the
  // fitted line
  line = slope * x_model + intercept;

  // create posterior samples for PPC
  /* for (n in 1:N) { */
    
  /*   ppc_x[n] = normal_rng(x_latent[n], sigma_x); */
  /*   ppc_y[n] = normal_rng(slope * ppc_x[n] + intercept, sigma_y); */

  //  }
  

}
