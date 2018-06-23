
transformed data {

  real<lower=0> sigma = 1;
  real slope = 2.;
  real intercept = 1.;
  int<lower=0> N;

}

generated quantities {
  
  
  vector[N] x_obs = uniform_rng(0, 10); 
  vector[N] y_obs;
  vector[N] y_latent;
  
  for (n in 1:N) {
    
    y_latent[n] = slope * x_obs[n] + intercept;
    
    y_obs[n] = normal_rng(y_latent[n], sigma);
    
    obs[n] = bernoulli_rng(p_det(x_obs_latent[n]));
    
  }
}

