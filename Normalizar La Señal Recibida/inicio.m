h = waitbar(0,'CARGANDO RED NEURONAL LOLA ... ');
for i=1:100, % computation here %
    pause(.001)
    waitbar(i/100)
end
close(h)
lola1;