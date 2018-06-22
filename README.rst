Simple Astrostatistics recipes
------------------------------------

We give solutions to commonly encountered problems.

1) Fit a line with errors in y
2) Fit a line with errors in x and y, if x should predict y
3) Fit a line with errors in x and y, if x and y are equal
4) Fit a powerlaw to objects
5) Fit a powerlaw to objects with errors

For each problem, we present:

* Code for Stan (install CmdStan, compile with "make stanfile.stan")
* Example data to try

The first example is fully worked out and step-by-step:

1) Fit a line with errors in y

Stan code:


