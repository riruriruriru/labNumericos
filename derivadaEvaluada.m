function [fxeval] = derivadaEvaluada(fx,x0)
    delta=10^(-10)
    fxeval=(fx(x0+delta)-fx(x0))/delta
    