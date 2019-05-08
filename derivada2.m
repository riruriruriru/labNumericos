function [fp]=derivada2(f,alfa,h)
  fp=(feval(f,alfa+h)-feval(f,alfa))/h;