% Aufgabe 1.3: Idealer invertierender PI-Regler
% Beispiel: u(t) = U0 fuer t >= 0; uC(0) = uC0.
% Die Zahlenwerte sind frei gewaehlt, nicht im Skriptum vorgegeben.

%% 1. Bauteile und Anfangswert
R1 = 10e3;       % Ohm: 10 kOhm
R2 = 20e3;       % Ohm: 20 kOhm
C = 100e-6;      % Farad: 100 Mikrofarad
uC0 = 0;         % Volt: Kondensatorspannung zum Start
U0 = 1;          % Volt: konstante Eingangsspannung ab t = 0

%% 2. Zeitpunkte und Eingangsspannung
t = linspace(0, 5, 501);   % 501 Zeitpunkte von 0 bis 5 Sekunden
u = U0 * ones(size(t));    % An jedem Zeitpunkt dieselbe Spannung U0

%% 3. Gleichungen aus der Herleitung
% Zustandsgleichung: duC/dt = u/(R1*C)
% Fuer konstantes u = U0 ist die Steigung konstant.
% Integration mit uC(0) = uC0 ergibt:
uC = uC0 + (U0 / (R1 * C)) * t;

% Ausgangsgleichung: y = -uC - (R2/R1)*u
y = -uC - (R2 / R1) * u;

%% 4. Spannungsverlaeufe zeichnen
figure;

subplot(3, 1, 1);
plot(t, u, 'LineWidth', 1.5);
grid on;
ylabel('u(t) [V]');
title('Eingang: konstante Spannung ab t = 0');

subplot(3, 1, 2);
plot(t, uC, 'LineWidth', 1.5);
grid on;
ylabel('u_C(t) [V]');
title('Zustand: Kondensatorspannung');

subplot(3, 1, 3);
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Zeit t [s]');
ylabel('y(t) [V]');
title('Ausgang: y = -u_C - (R_2/R_1) u');
