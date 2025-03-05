# CATAM 2.4 Simulation of Random Samples from Parametric Distributions
A rewrite of my Cambridge CATAM undergraduate project, "Simulation of Random Samples from Parametric Distributions".

## R

[R](https://www.r-project.org/) is the standard programming language for much of the data science world, especially for areas like statistics and bioinformatics. The high performance and wide selection of available statistical packages make it well-suited for projects like this one.

## R Markdown

In a deviation from most other CATAM projects on my GitHub, this README isn't a self-contained project summary. Instead, I split some parts into [R Markdown](https://rmarkdown.rstudio.com/) documents. R Markdown is a notebook interface that lets you integrate data, code and analysis, to ensure your work is verifiable and reproduceable.

## Project

When a random variable $X$ has a continuous and strictly increasing distribution function $F$ with a computable inverse, it's possible to sample from $X$ by computing $F^{-1}(U)$ for a uniform random variable $U$ ([Lemma 1](#lemma-1)).

This project uses this idea to sample from some standard parametric distributions.

The distributions considered are:
- The exponential distribution ([Rmd](Rmd/exponential-distribution.Rmd), [pdf](Rmd/exponential-distribution.pdf)), dealing with CATAM problems 1-4; 
- The gamma distribution ([Rmd](Rmd/gamma-distribution.Rmd), [pdf](Rmd/gamma-distribution.pdf)), dealing with CATAM problems 5-8;
- The normal distribution ([Rmd](Rmd/normal-distribution.Rmd), [pdf](Rmd/normal-distribution.pdf)), dealing with CATAM problems 9-12; and
- The $\chi^2$ distribution ([Rmd](Rmd/chi-square-distribution.Rmd), [pdf](Rmd/chi-square-distribution.pdf)), dealing with CATAM problem 13.

## Appendix A: Proofs

### Lemma 1

Suppose $X$ is a random variable with a continuous and strictly increasing distribution function $F$. Then $F^{-1}$ exists, $F(X)$ is uniformly distributed on $[0,1]$, and $F^{-1}(U)$ will have the distribution function $F$ for $U\sim \text{Unif}[0,1]$.

#### Proof

It is a standard fact that a strictly increasing continuous function is invertible.

We can compute, for $0 \le x \le 1,$ $$\begin{split}  \mathbb{P}(F(X)<x) & = \mathbb{P}(X<F^{-1}(x)) \\\ & = F(F^{-1}(x)) \\\ & = x\end{split}$$

So $F(X)$ is uniformly distributed. From this, the last claim immediately follows.

$\square$

In particular, the conditions of the lemma are satisfied when the probability density function is lebesgue integrable and the zero values are a [null set](https://en.wikipedia.org/wiki/Null_set).