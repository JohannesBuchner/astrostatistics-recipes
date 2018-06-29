data {
	int N;
	vector[N] logsamples;
}
transformed data {
	vector[N] samples;
	
	for (i in 1:N) {
		samples[i] <- pow(10, logsamples[i]);
	}
}
parameters {
	real<lower=0,upper=10> loglo;
	real<lower=-10, upper=0> slope;
}
model {
	samples ~ pareto(pow(10, loglo), -slope);
}


