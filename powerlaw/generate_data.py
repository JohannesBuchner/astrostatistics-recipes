import numpy

numpy.random.seed(1)

# powerlaw to generate
N = 100
slope = -2
min_logvalue = 9

logsamples = min_logvalue - numpy.log10(numpy.random.power(-slope, size=100))

# save
numpy.savetxt("data.txt", logsamples)
with open("data.stan.rdata", 'w') as fout:
	fout.write("N <- %d\n" % len(logsamples))
	fout.write("logsamples <- c(%s)\n" % ','.join([str(s) for s in logsamples]))


# visualise
from matplotlib import pyplot as plt
plt.hist(logsamples, bins=40)
x = numpy.linspace(9, 11, 40)
plt.plot(x, 20. * (10**(x-9.))**slope)
plt.savefig('data.png', bbox_inches='tight')

