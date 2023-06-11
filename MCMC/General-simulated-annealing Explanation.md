 *Simulated annealing* technique involves simulating a non-homogeneous Markov chain whose invariant distribution at iteration $` i `$ is no longer equal to $` p(x) `$, but to $` p_i (x) \propto p^{1/T_i } (x) `$,  

1. Initialize $x^{0}$ and set $` T_0 = 1 `$  
2. For $i=0$ to $N-1$  
       - Sample $u \sim U(0,1)$  
       - Sample $x^* \sim q(x^* | x^{(i)})$  
       - If $`u \lt  A( x^{(i)}, x^{*})  = \min \left\{ 1, \frac{p(x^{*})q(x^{(i)}|x^{*}}{p(x^{(i)}q(x^{*}|x^{(i)}}  \right\}`$  
                   　　　　 $x^{(i+1)} = x^* $  
        　 else  
                   　　　　 $x^{(i+1)} = x^{(i)}$   
       - Set $` T_{i+1} `$ according to a chosen cooling schedule.   

  where $` T_i `$ is a decreasing cooling schedule with $` \lim _{i \rightarrow \infty } T_i =  0 `$ .   
  The reason for doing this is that, under weak regularity assumptions on $` p(x), p^\infty (x)`$ is a probability density that concentrates itself on the set of global maxima of $` p(x) `$.  
  
  Most convergenece results for simulated annealing typically state that if for a given $` T_i `$ , the homogeneous Markov trasition kerenel mixes quickly enough, then convergence to the set of global maxima of $` p(x) `$ is ensured for a sequence $` T_i = (C \ln (i+T_0)) ^ {-1} `$,
  where $`C`$ and $` T_0 `$ are problem-dependent.  
  
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/9fd4d1e5-9512-47b8-b137-8a9d5c9aa8d5)
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/1c0621c9-5c4d-49d4-a8f2-83e61e5e2c65)
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/77f187f5-b680-4ffb-b819-8c05593faf57)
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/9bdd69cb-8532-4106-b087-aee8cf157fbb)


Reference :  https://www.cs.ubc.ca/~arnaud/andrieu_defreitas_doucet_jordan_intromontecarlomachinelearning.pdf
