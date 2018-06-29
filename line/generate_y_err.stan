
data {

  // example parameters for the
  // generated data
  real<lower=0> sigma;
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
  vector[n_obs] y_latent;
  
  for (n in 1:N) {

    // randomly pull x from a uniform distribution
    x_obs[n] = uniform_rng(x_min, x_max);

    // calculate the latent y 
    y_latent[n] = slope * x_obs[n] + intercept;

    // obscure y with measurement error
    y_obs[n] = normal_rng(y_latent[n], sigma);
        
  }
}

