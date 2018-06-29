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
	real<lower=-10,upper=10> lo;
	real<lower=-10, upper=10> slope;
}
model {
	samples ~ pareto(lo, -slope);
}


