# Metropolis-Hastings Algorithm

*Metropolis-Hastings* (MH) algorithm is the most popular MCMC method.  
An MH step of invariant distribution $`p(x)`$ and proposal distribution $`q(x^* | x) `$ involoves sampling a candidate value $`x^* `$ given the current value $` x `$ according to $` q(x^* | x) `$.
The Markov chain then moves towards $` x^* `$ with acceptance probability $` A(x,x^* ) = \min \left\{ 1, [p(x)q(x^* | x)]^{-1} p(x^* ) q(x| x^* ) \right\} `$, otherwise it remains at $` x `$.   

The psudo-code is   

1. Initialize $x^{0}$
2. For $i=0$ to $N-1$  
       - Sample $u \sim U(0,1)$  
       - Sample $x^* \sim q(x^* | x^{(i)})$  
       - If $`u \lt  A( x^{(i)}, x^{*})  = \min \left\{ 1, \frac{p(x^{*})q(x^{(i)}|x^{*}}{p(x^{(i)}q(x^{*}|x^{(i)}}  \right\}`$  
                   　　　　 $x^{(i+1)} = x^* $  
        　 else  
                   　　　　 $x^{(i+1)} = x^{(i)}$ 
                  
    
## Plots

![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/e06359c6-8c90-45c0-81d9-5de27a3cfa1b)
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/ceca2eb2-675d-46e2-b979-cfee1ea0a3fb)
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/d15591fb-8cb3-4c96-9033-c34b0254bbe5)
![image](https://github.com/shkim99stat/Bayesian-Inference/assets/83656698/d3fdd74e-3bd9-441d-b1e2-c74ee4f05105)



Reference :  https://www.cs.ubc.ca/~arnaud/andrieu_defreitas_doucet_jordan_intromontecarlomachinelearning.pdf
