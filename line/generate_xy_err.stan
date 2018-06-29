

data {

  real<lower=0> sigma_y;
  real<lower=0> sigma_x;
  real slope;
  real intercept;
  int<lower=0> n_obs;
  real x_min;
  real x_max;

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
    x_latent[n] = uniform_rng(x_min, x_max);

    // calculate the latent y 
    y_latent[n] = slope * x_latent[n] + intercept;

    // obscure y with measurement error
    y_obs[n] = normal_rng(y_latent[n], sigma_y);
    // obscure y with measurement error
    x_obs[n] = normal_rng(x_latent[n], sigma_x);

        
  }
}

