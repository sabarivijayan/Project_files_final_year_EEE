n = 4;
d = [1 2 0];
g = tf(n,d);
pm = 50;
kv = 20;

n1 = 40;
d1 = [1 2 0];
g1 = tf(n,d);

bode(g1), grid on;

[gmuc,pmuc,gcf,pcf] = margin(g1);

pm = pm-pmuc+10;
alpha = (1-sin(pm*pi/180))/(1+sin(pm*pi/180));
mag = -20*log10(1/sqrt(alpha))

gcnew = 9.37;

zc = -gcnew*sqrt(alpha);

pc = -gcnew/sqrt(alpha);

comp = zpk([zc],[pc], k/alpha);

compsys = comp*g

kvc = dcgain(tf([1 0], 1)*compsys);

bode(g,'r',comp,'g',compsys,'b'), grid on;

legend('uncompsys','comp','compsys');

[gm,pm,gcf,pcf] = margin(compsys)