
transformed data {

  // example parameters for the
  // generated data
  real<lower=0> sigma_y = 1;
  real<lower=0> sigma_x = 2.;
  real slope = 2.;
  real intercept = 1.;
  int<lower=0> n_obs = 25;
  
}

generated quantities {
  
  // storage for the generated data
  int N = n_obs;
  vector[n_obs] x_obs;
  vector[n_obs] y_obs;
  vector[n_obs] x_latent;
  vector[n_obs] y_latent;
  
  for (n in 1:N) {

    // randomly pull x from a uniform distribution
    x_latent[n] = uniform_rng(0, 10);

    // calculate the latent y 
    y_latent[n] = slope * x_latent[n] + intercept;

    // obscure y with measurement error
    y_obs[n] = normal_rng(y_latent[n], sigma_x);
    // obscure y with measurement error
    x_obs[n] = normal_rng(x_latent[n], sigma_y);

        
  }
}

