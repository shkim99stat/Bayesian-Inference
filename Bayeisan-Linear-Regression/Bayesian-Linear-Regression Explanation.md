Simplicity, a conjugate prior is used for the latent weights.  
Specifically, assume that $`{\mathbf{w}\overset{\text{iid}}{\sim}\mathcal{N}(\mathbf{0},\beta^{-1}\mathbf{I})}`$ such that $`\beta>0`$ is the hyperparameter as known value.

The posterior distribution based on the Bayes' rule is given by   


$$ P(\mathbf{w}|\mathbf{y}) = \frac{P(\mathbf{w})P(\mathbf{y} | \mathbf{w})}{P(\mathbf{y})} $$


The likelihood function in matrix form is given by

$$ P(\mathbf{y} | \mathbf{w}) \propto \exp \left\[ -\frac{\alpha}{2} ( \mathbf{y} - \boldsymbol{\mathfrak{A}} \mathbf {w}  )^T ( \mathbf {y} - \boldsymbol{\mathfrak{A}} \mathbf {w}) \right\]  $$

where $`\boldsymbol{\mathfrak{A}}\triangleq\left[(\mathbf{x}_i^{\text{T}})\right]$, i.e. $\boldsymbol{\mathfrak{A}}\in(\mathbb{R}^{n}\times\mathbb{R}^d)`$ , this matrix is known as the *design matrix*.

Give that  $`\mathbf{w}`$ has the following prior distribution  

$$ P(\mathbf w  )= \frac{1}{\sqrt{(2\pi)^d | \beta ^ {-1} \mathbf I |}} \exp \left\[ -\frac{1}{2} \mathbf w ^T \beta \mathbf I \mathbf w \right\]$$   


implies that the posterior has the following form:

$$ P(\mathbf w | \mathbf y ) \propto \exp \left\[ - \frac{1}{2} \left\[ \alpha ( \mathbf y -  \boldsymbol{\mathfrak{A}} \mathbf w )^T (\mathbf y -  \boldsymbol{\mathfrak{A}} \mathbf w ) + \mathbf w^T \beta \mathbf I \mathbf w \right\] \right\] $$


Expanding the terms in the exponent, becomes 

$$ \alpha \mathbf y ^T \mathbf y - 2\alpha \mathbf w ^T \boldsymbol{\mathfrak{A}}^T \mathbf y + \mathbf w^T (\alpha \boldsymbol{\mathfrak{A}}^T \boldsymbol{\mathfrak{A}} + \beta \mathbf I ) \mathbf w $$


The next step is to complete the square of the above equation such that it resembles the inner terms of the exponential factor of the Normal distribution. 

That is, the quadratic form of the exponential term of a  $`\mathcal{N}(\mathbf{w}|\boldsymbol{\mu},\boldsymbol{\Sigma}^{-1})`$ is given by 

$$ (\mathbf w - \mathbf \mu)^T \Sigma^{-1} (\mathbf w - \mathbf \mu ) = \mathbf w ^T \Sigma^{-1} \mathbf w - 2\mathbf w ^T \Sigma ^{-1} \mathbf \mu + \mathbf \mu^T \Sigma^{-1} \mathbf \mu $$

$$ \Sigma^{-1} = \alpha \boldsymbol{\mathfrak{A}}^T \boldsymbol{\mathfrak{A}} + \beta \mathbf I $$

and 

$$ \mathbf w ^T \Sigma ^{-1} \mathbf \mu = \alpha \mathbf w^T \boldsymbol{\mathfrak{A}}^T \mathbf y $$

$$ \Sigma ^{-1} \mathbf \mu = \alpha \boldsymbol{\mathfrak{A}}^T \mathbf y $$

$$ \mathbf \mu = \alpha \Sigma \boldsymbol{\mathfrak{A}}^T \mathbf y $$


Thus, the *a posteriori* is a Normal distribution with mean $` \mathbf \mu = \alpha \Sigma \boldsymbol{\mathfrak{A}}^T \mathbf y `$ and standard deviation given by the inverse of Equation $`\boldsymbol{\Sigma}^{-1} =  \alpha \boldsymbol{\mathfrak{A}}^T \boldsymbol{\mathfrak{A}} +\beta \mathbf I `$

We leave to the reader the proper mathematical derivation of  $\boldsymbol{\mu}$ and $\boldsymbol{\Sigma}$ without matching like what we did above.


![jl_187MNolSDC](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/e1a5696f-6af6-453e-b465-fd481bffac1c)



