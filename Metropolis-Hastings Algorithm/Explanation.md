# Metropolis-Hastings Algorithm

1. Initialize $x^{0}$
2. For $i=0$ to $N-1$
        Sample $u \sim U(0,1)$  
        Sample $x^* \sim q(x^* | x^{(i)})$  
        If $u \lt A(x^{(i)},x^{*}) = \min \left\{ 1, \frac{p(x^* )q(x^{(i)}|x^* }{p(x^{(i)}q(x^* |x^{(i)}}  \right\}$  
              $x^{(i+1)} = x^* $  
        else  
              $x^{(i+1)} = x^{(i)}$  
